import argparse

class TagsJoin(argparse.Action):

     def __call__(self, parser, namespace, values, option_string=None):
         setattr(namespace, self.dest, ';'.join(values))

class QueryJoin(argparse.Action):

     def __call__(self, parser, namespace, values, option_string=None):
         setattr(namespace, self.dest, ' '.join(values))

parser = argparse.ArgumentParser(description='Search for *overflow answers.', epilog="example: sas how to exit vim? -t vim vi -s askubuntu")

parser.add_argument( 'query',         type=str, metavar='q', action=QueryJoin, nargs='+', help='search query')
parser.add_argument( '--order', '-o', type=str, default="desc", choices=['desc', 'asc'], help='order by (default:desc)')
parser.add_argument( '--site',  '-s', type=str, default="stackoverflow", help='which site to search (default: stackoverflow)')
parser.add_argument( '--sort',  '-r', type=str, default="votes", help='sort order by (default:votes)')
parser.add_argument( '--tags',  '-t', type=str, nargs="+", action=TagsJoin, help='specify exact tags')

def run():
    args = parser.parse_args()
    return vars(args)

