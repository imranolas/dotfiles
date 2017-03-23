#!/usr/local/bin/node

const execSync = require('child_process').execSync;

const APPS = [
  { name: 'Slack', id: 803453959 },
  { name: 'Gifox', id: 1082624744 },
  { name: 'BetterSnapTool', id: 417375580 },
  { name: 'The Clock', id: 488764545 }
];

execSync(`mas install ${APPS.map(app => app.id).join(' ')}`, {
  stdio: 'inherit'
});
