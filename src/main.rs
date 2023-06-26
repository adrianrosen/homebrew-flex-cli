use std::fs::File;
use std::io::{BufRead, BufReader, Write};
use std::path::PathBuf;
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let mut file_path = PathBuf::from(env::var("HOME").unwrap());
    file_path.push(".flex-cli");

    let mut hours = read_hours(&file_path).unwrap_or(0.0);

    match args.get(1).map(|s| s.as_str()) {
        Some("in") => {
            let new_hours = args.get(2).and_then(|s| s.parse().ok()).unwrap_or(0.0);
            if new_hours % 0.25 != 0.0 {
                println!("Invalid input. Hours must be in 0.25 intervals.");
                return;
            }
            hours += new_hours;
            write_hours(&file_path, hours).unwrap();
            println!("{} hours saved", hours);
        }
        Some("out") => {
            let new_hours = args.get(2).and_then(|s| s.parse().ok()).unwrap_or(0.0);
            if new_hours % 0.25 != 0.0 {
                println!("Invalid input. Hours must be in 0.25 intervals.");
                return;
            }
            hours -= new_hours;
            write_hours(&file_path, hours).unwrap();
            println!("{} hours saved", hours);
        }
        Some("show") => {
            println!("Hours: {}", hours);
        }
        _ => {
            println!("Invalid input. Usage: flex-cli [in|out|show] [hours]");
        }
    }
}

fn read_hours(file_path: &PathBuf) -> Option<f64> {
    let file = File::open(file_path).ok()?;
    let reader = BufReader::new(file);
    reader.lines().next().and_then(|line| line.ok()?.parse().ok())
}

fn write_hours(file_path: &PathBuf, hours: f64) -> std::io::Result<()> {
    let mut file = File::create(file_path)?;
    writeln!(file, "{}", hours)?;
    Ok(())
}
