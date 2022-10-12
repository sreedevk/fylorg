use glob::glob;
use super::config::Map;
use std::fs;
use regex::RegexSet;
use std::path::PathBuf;
use itertools::Itertools;

#[derive(Debug)]
pub struct Organizer {
    pub configuration: Map
}

impl Organizer {
    pub fn new(configuration: Map) -> Organizer {
        Organizer { configuration  } 
    }

    pub fn organize(&self) {
        let config_clone = self.configuration.clone();
        fs::create_dir(&config_clone.organized_dir)
            .expect("Failed to create organized dir!");

        for entry in config_clone.entries {
            fs::create_dir(
                format!("{}/{}", config_clone.organized_dir, entry.category))
                .expect("Failed to create target dir!");

            self.filter_files(self.ls(), entry.keywords)
                .into_iter()
                .foreach(|filepath| {
                    fs::rename(
                        &filepath,
                        self.target_filepath(&filepath, &entry.category)
                    ).expect("Failed to move files!");
                })
        };
    }

    fn target_filepath(&self, filepath: &PathBuf, category: &String) -> PathBuf {
       let mut targetpath = PathBuf::new(); 
        targetpath.push(&self.configuration.organized_dir);
        targetpath.push(category);
        targetpath.push(filepath.file_name().and_then(|fnm| fnm.to_str() ).unwrap());

        targetpath
    }

    fn ls(&self) -> Vec<PathBuf> {
        self
            .configuration
            .filetypes
            .clone()
            .into_iter()
            .map(|ftype| {
                glob(format!("{}/*.{}", self.configuration.base_dir, ftype).as_str())
                    .expect("UNABLE TO PROCESS GLOB SEARCH")
                    .map(|file| file.unwrap() )
            })
            .flatten()
            .collect::<Vec<PathBuf>>()

    }

    fn filter_files(&self, filelist: Vec<PathBuf>, keywords: Vec<String>) -> Vec<PathBuf> {
        let regexp = RegexSet::new(&keywords).expect("Invalid Keyword found!");

        filelist
            .into_iter()
            .filter(|file| regexp.is_match(file.as_path().display().to_string().as_str()) )
            .collect::<Vec<PathBuf>>()
    }
}
