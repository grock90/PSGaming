class Dice
{
    [int]$MaxValue
    [int]$CurrentValue
    [int]$LastValue

    Dice([int]$MaxValue){
        $this.MaxValue = $MaxValue
    }

    [void] Roll()
    {
        $this.LastValue = $this.CurrentValue
        $this.CurrentValue = Get-Random -Minimum 1 -Maximum $this.MaxValue
    }

    [void] Show()
    {
        [System.Windows.MessageBox]::Show($this.CurrentValue,'Dice Roll','OK')
    }

    [void] Reset()
    {
        $this.CurrentValue = 0
        $this.LastValue = 0
    }
}