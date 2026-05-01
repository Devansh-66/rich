from rich.console import Console
from rich.panel import Panel
from rich.columns import Columns

def test_panel_columns_expand():
    console = Console(width=100, color_system=None)
    columns = Columns(["c1", "c2"])
    panel = Panel(columns, expand=False)
    
    with console.capture() as capture:
        console.print(panel)
        
    output = capture.get()
    first_line = output.splitlines()[0]

    assert len(first_line) < 50
