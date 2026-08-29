use crc32fast::Hasher;
use std::fs::File;
use std::io::{self, Read};

fn compute_file_crc32(path: &str) -> io::Result<u32> {
    let mut file = File::open(path)?;
    let mut hasher = Hasher::new();
    let mut buffer = [0u8; 8192];

    loop {
        let count = file.read(&buffer)?;
        if count == 0 {
            break;
        }
        hasher.update(&buffer[..count]);
    }

    Ok(hasher.finalize())
}
