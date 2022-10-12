mod cli;
mod config;
mod organizer;

use cli::{AppArgs, Parser};
use organizer::Organizer;

fn main() -> Result<(), Box<dyn std::error::Error>> { 
    let args   = AppArgs::parse();
    let config = config::Map::new(args).unwrap();
    let organizer = Organizer::new(config);

    dbg!(organizer.organize());
    Ok(())
}
