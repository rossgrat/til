# Disk usage CLI
MacOS provides a command line utility `du` for examining disk usage. Here is a chain of commands that show the 20 largest disk offenders in the home directory:
```
du -sh /Users/r.grattafiori/* /Users/r.grattafiori/.* 2>/dev/null | sort -rh | head -20
```

