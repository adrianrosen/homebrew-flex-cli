import os
import sys

file_path = os.path.expanduser("~/.flex-cli")

def main():
    if len(sys.argv) not in [2, 3]:
        print("Usage: flex-cli.py <mode> <hours>")
        return

    mode = sys.argv[1]

    if mode not in ["in", "out", "show"]:
        print("Invalid mode. Mode must be 'in', 'out', or 'show'.")
        return

    if mode in ["in", "out"]:
        if len(sys.argv) != 3:
            print("Usage: flex-cli.py <mode> <hours>")
            return

        hours = sys.argv[2]

        if not is_valid_hours(hours):
            print("Invalid input. Hours must be in 0.25 intervals.")
            return

    if mode == "in":
        add_hours(float(hours))
        show_hours()
    elif mode == "out":
        remove_hours(float(hours))
        show_hours()
    elif mode == "show":
        show_hours()

def is_valid_hours(hours):
    try:
        hours = float(hours)
    except ValueError:
        return False

    return hours % 0.25 == 0

def add_hours(hours):
    current_hours = get_hours()
    new_hours = current_hours + hours
    write_hours(new_hours)

def remove_hours(hours):
    current_hours = get_hours()
    new_hours = current_hours - hours
    write_hours(new_hours)

def show_hours():
    current_hours = get_hours()
    print("Currently saved hours:", current_hours)

def get_hours():
    if not os.path.exists(file_path):
        write_hours(0)

    with open(file_path, "r") as f:
        return float(f.read())

def write_hours(hours):
    with open(file_path, "w") as f:
        f.write(str(hours))

if __name__ == "__main__":
    main()