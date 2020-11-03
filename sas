#!/usr/bin/env python3
from cli import client as cli_client
from api import client as api_client
import json
import curses

def format_menu(i):
    return {
        "title":i["title"],
        "score":i["score"],
        "link":i["link"]
    }

# results = api_client.search(cli_client.run())
# print(json.dumps(results))
# exit()

with open("example.json") as f:
    results = f.read()

results = json.loads(results)
menu = [ format_menu(i) for i in results["items"] ]
def quit():
    exit(0)

def down(stdscr):
    stdscr.addstr(0,0,"DOWN")

def left(stdscr):
    stdscr.addstr(0,0,"LEFT")

menu_nav = {
    ord("q"): quit,
    ord("j"): down,
    ord("J"): left
}


from curses import wrapper

def main(stdscr):
    # turn off cursor blinking
    curses.curs_set(0)

    # color scheme for selected row
    curses.init_pair(1, curses.COLOR_BLACK, curses.COLOR_WHITE)

    # specify the current selected row
    current_row = 0
    print_menu(stdscr, 0)
    while 1:
        key = stdscr.getch()
        menu_nav[key](stdscr)

def print_menu(stdscr, selected_row_idx):
    stdscr.clear()
    h, w = stdscr.getmaxyx()
    for idx, row in enumerate(menu):
        x = w//2 - len(row)//2
        y = h//2 - len(menu)//2 + idx

        if idx == selected_row_idx:
            stdscr.attron(curses.color_pair(1))
            stdscr.addstr(y, x, row["title"])
            stdscr.attroff(curses.color_pair(1))
        else:
            stdscr.addstr(y, x, row["title"])
        stdscr.refresh()

wrapper(main)
