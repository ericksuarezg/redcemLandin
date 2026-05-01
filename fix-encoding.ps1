function New-Text {
    param([int[]]$Codes)
    -join ($Codes | ForEach-Object { [char]$_ })
}

$replacements = @(
    @( (New-Text 0x00C3,0x00A1), (New-Text 0x00E1) ),
    @( (New-Text 0x00C3,0x00A9), (New-Text 0x00E9) ),
    @( (New-Text 0x00C3,0x00AD), (New-Text 0x00ED) ),
    @( (New-Text 0x00C3,0x00B3), (New-Text 0x00F3) ),
    @( (New-Text 0x00C3,0x00BA), (New-Text 0x00FA) ),
    @( (New-Text 0x00C3,0x00B1), (New-Text 0x00F1) ),
    @( (New-Text 0x00C3,0x0081), (New-Text 0x00C1) ),
    @( (New-Text 0x00C3,0x0089), (New-Text 0x00C9) ),
    @( (New-Text 0x00C3,0x008D), (New-Text 0x00CD) ),
    @( (New-Text 0x00C3,0x0093), (New-Text 0x00D3) ),
    @( (New-Text 0x00C3,0x009A), (New-Text 0x00DA) ),
    @( (New-Text 0x00C3,0x0091), (New-Text 0x00D1) ),
    @( (New-Text 0x00C3,0x00BC), (New-Text 0x00FC) ),
    @( (New-Text 0x00C3,0x009C), (New-Text 0x00DC) ),
    @( (New-Text 0x00C2,0x00A9), (New-Text 0x00A9) ),
    @( (New-Text 0x00C2,0x00BF), (New-Text 0x00BF) ),
    @( (New-Text 0x00C2,0x00A1), (New-Text 0x00A1) ),
    @( (New-Text 0x00C2,0x00BA), (New-Text 0x00BA) ),
    @( (New-Text 0x00C2,0x00AA), (New-Text 0x00AA) ),
    @( (New-Text 0x00C2,0x00A0), (New-Text 0x0020) ),
    @( (New-Text 0x00E2,0x0080,0x0094), (New-Text 0x2014) ),
    @( (New-Text 0x00E2,0x0080,0x0093), (New-Text 0x002D) ),
    @( (New-Text 0x00E2,0x0080,0x0098), (New-Text 0x2018) ),
    @( (New-Text 0x00E2,0x0080,0x0099), (New-Text 0x2019) ),
    @( (New-Text 0x00E2,0x0080,0x009C), (New-Text 0x201C) ),
    @( (New-Text 0x00E2,0x0080,0x009D), (New-Text 0x201D) ),
    @( (New-Text 0x00E2,0x0080,0x00A6), (New-Text 0x2026) )
)

Get-ChildItem -Filter *.html | ForEach-Object {
    $text = Get-Content -Raw -Path $_.FullName
    foreach ($pair in $replacements) {
        $text = $text.Replace($pair[0], $pair[1])
    }
    Set-Content -Path $_.FullName -Value $text -Encoding utf8
}
