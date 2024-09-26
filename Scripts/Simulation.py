import subprocess
import os

class Simulation():
    def __init__(self, simdir, simfile, synthdir=None, synthfile=None, synthsimfile=None, impldir=None, implfile=None, implsimfile=None, junk_files = []): #simulation file should handle more
        self.simdir = os.path.abspath(simdir)
        self.simfile = simfile
        self.synthdir = synthdir
        self.synthfile = synthfile
        self.synthsimfile = synthsimfile
        self.impldir = impldir
        self.implfile = implfile
        self.implsimfile = implsimfile
        self.junk_files = junk_files

    def runSimulation(self, runcommands=[], runargs = {'shell': True, 'capture_output': True, 'text': True }):
        if runcommands.length == 0:
            commands = [
                "vivado_init",
                "vivado -mode batch -source {self.simfile}"
            ]
            try:
                result = subprocess.run(commands, cwd=self.simdir, shell=runargs['shell'], capture_output=runargs['capture_output'], text=runargs['text'])
                print(result.stdout.decode().strip())
                if result.stderr:
                    print(result.stderr.decode().strip())
            except:
                print('Error: unable to run simulation commands')
        else:
            try:
                result = subprocess.run(runcommands, cwd=self.simdir, shell=runargs['shell'], capture_output=runargs['capture_output'], text=runargs['text'])
                print(result.stdout.decode().strip())
                if result.stderr:
                    print(result.stderr.decode().strip())
            except:
                print('Error: unable to run simulation commands')
    
    def removeJunkFiles():
        return       