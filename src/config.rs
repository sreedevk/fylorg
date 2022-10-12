use serde::{Serialize, Deserialize};
use std::fs;
use std::env;

use crate::cli::AppArgs;

#[derive(Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Entry {
    pub keywords: Vec<String>,
    pub category: String
}

#[derive(Debug, Clone)]
pub struct Map {
    pub base_dir: String,
    pub organized_dir: String,
    pub filetypes: Vec<String>,
    pub entries: Vec<Entry>
}

impl Map {
    pub fn new(args: AppArgs) -> Result<Map, serde_json::Error> {
        let raw_content = fs::read_to_string(args.map).expect("Unable to load configs.");
        match serde_json::from_str::<Vec<Entry>>(&raw_content) {
            Ok(config) => {
                Ok(
                    Map{
                        entries: config,
                        organized_dir: args.output_dir,
                        base_dir: env::current_dir()
                            .unwrap()
                            .into_os_string()
                            .into_string()
                            .unwrap(),
                        filetypes: args
                            .filetypes
                            .split(",")
                            .map(|raw| raw.to_string() )
                            .collect()
                    }
                ) 
            },
            Err(err) => Err(err)
        }
    }
}
