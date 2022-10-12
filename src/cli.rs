pub use clap::Parser;

#[derive(Parser, Debug)]
#[command(name = "fylorg", about = "A Smart File Organizer.", long_about = None)]
#[command(author = "Sreedev Kodichath <sreedev@icloud.com>", version = "0.0.1")]
pub struct AppArgs {
    #[arg(short, long, value_name = "pdf,txt,md")]
    pub filetypes: String,
    #[arg(short, long, value_name = "./fylorged")]
    pub output_dir: String,
    #[arg(short,long, value_name = "./fylorg.json")]
    pub map: String
}
