# Tags
[
  { name: 'docker', color: '#ffffff', background: 'orange' },
  { name: 'css', color: '#000000', background: '#FFF1E2' },
  { name: 'javascript', color: '#000000', background: 'silver' },
  { name: 'html', color: '#000000', background: '#FEC7AC' },
  { name: 'react', color: '#ffffff', background: '#D3A33C' },
  { name: 'vue', color: '#ffffff', background: 'orange' },
  { name: 'security', color: '#ffffff', background: 'coral' },
  { name: 'git', color: '#ffffff', background: '#FF99B5' },
  { name: 'node', color: '#ffffff', background: '#FF0369' },
  { name: 'angular', color: '#ffffff', background: '#8AC858' },
  { name: 'typescript', color: '#ffffff', background: 'green' },
  { name: 'docker', color: '#ffffff', background: 'teal' },
  { name: 'linux', color: '#ffffff', background: '#74C5E0' },
  { name: 'graphql', color: '#ffffff', background: 'turquoise' },
  { name: 'postgres', color: '#ffffff', background: 'blue' },
  { name: 'vscode', color: '#ffffff', background: 'navy' },
  { name: 'vim', color: '#ffffff', background: 'purple' },
  { name: 'terminal', color: '#ffffff', background: '#B288BD' },
  { name: 'books', color: '#ffffff', background: '#7A75D2' },
  { name: 'database', color: '#ffffff', background: 'red' },
  { name: 'sql', color: '#ffffff', background: '#860E11' },
  { name: 'tutorial', color: '#ffffff', background: 'grey' },
  { name: 'productivity', color: '#ffffff', background: 'brown' },
  { name: 'testing', color: '#ffffff', background: 'black' }
].each { |tag| Tag.find_or_create_by(name: tag[:name]).update(tag) }

# Topic
[ 
  "Programming", "Technology", "Health", "Work", "Business", "Language", "Food"
].each { |title| Topic.find_or_create_by(title: title) }