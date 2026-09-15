-- Lmlm: Organize files, merge PDFs, zip images, and log results locally
set localFolder to (path to downloads folder as text)
set pdfFolder to (localFolder & "PDFs:")
set imgFolder to (localFolder & "Images:")
set logFile to (localFolder & "Lmlm_Report.txt")

tell application "Finder"
    -- Create folders if they don’t exist
    if not (exists folder pdfFolder) then
        make new folder at localFolder with properties {name:"PDFs"}
    end if
    if not (exists folder imgFolder) then
        make new folder at localFolder with properties {name:"Images"}
    end if
    
    -- Move files into folders
    set fileList to every file of folder localFolder
    repeat with f in fileList
        set fileName to name of f
        if fileName ends with ".pdf" then
            move f to folder pdfFolder
        else if fileName ends with ".jpg" or fileName ends with ".png" then
            move f to folder imgFolder
        end if
    end repeat
end tell

-- Merge PDFs
set mergedPath to (POSIX path of pdfFolder & "merged.pdf")
set pdfFiles to {}
tell application "Finder"
    set pdfFiles to files of folder pdfFolder
end tell

set pdfPaths to {}
set pdfNames to {}
repeat with f in pdfFiles
    set end of pdfPaths to (POSIX path of (f as alias))
    set end of pdfNames to (name of f)
end repeat

set pdfCount to (count of pdfPaths)
if pdfCount > 1 then
    do shell script "pdfunite " & (quoted form of (item 1 of pdfPaths)) & " " & (quoted form of (item 2 of pdfPaths)) & " " & quoted form of mergedPath
end if

-- Zip Images
set zipPath to (POSIX path of imgFolder & "images.zip")
do shell script "cd " & quoted form of (POSIX path of imgFolder) & " && zip -r " & quoted form of zipPath & " ."
tell application "Finder"
    set imgFiles to files of folder imgFolder
end tell

set imgNames to {}
repeat with f in imgFiles
    set end of imgNames to (name of f)
end repeat
set imgCount to (count of imgNames)

-- Write Detailed Log Report
set logText to "Lmlm Report:" & return & ¬
    "Merged PDFs (" & pdfCount & "): " & (pdfNames as string) & return & ¬
    "Zipped Images (" & imgCount & "): " & (imgNames as string) & return & ¬
    "Report generated at: " & (current date) & return

set logFileRef to open for access file logFile with write permission
write logText to logFileRef starting at 0
close access logFileRef
