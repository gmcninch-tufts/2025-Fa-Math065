from graphviz import Digraph

# Create a new directed graph
dot = Digraph()

# Define the nodes (landmasses)
dot.node('A', 'Landmass A')
dot.node('B', 'Landmass B')
dot.node('C', 'Landmass C')
dot.node('D', 'Landmass D')

# Define the edges (bridges)
dot.edge('A', 'B', 'Bridge 1')
dot.edge('A', 'C', 'Bridge 2')
dot.edge('A', 'D', 'Bridge 3')
dot.edge('B', 'C', 'Bridge 4')
dot.edge('B', 'D', 'Bridge 5')
dot.edge('C', 'D', 'Bridge 6')
dot.edge('C', 'A', 'Bridge 7')

# Render the graph to a file and display it
dot.render('konigsberg_bridges', format='png', cleanup=True)
dot.view()
