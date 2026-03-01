#!/usr/bin/env bash

# Function that fetches the current workspaces and formats them into Eww's syntax
generate_yuck() {
  # We fetch the JSON array of current workspaces from Niri
  niri msg -j workspaces | jq -r '
    "(box :class \"workspaces\" :orientation \"h\" :space-evenly true :halign \"start\" :spacing 5 " +
    ([.[] | 
      
      # Map Niri state to LeftWM CSS classes (focused, visible, busy)
      # Note: Niri destroys empty workspaces, so if it exists but isn'\''t active, it is "busy"
      if .is_focused then "focused"
      elif .is_active then "visible"
      else "busy" end as $state |
      
      # Create the Eww button string
      "(button :onclick \"niri msg action focus-workspace \(.idx)\" " +
      ":class \"ws-button \($state)\" \"\(.name // .idx)\")"
      
    ] | join(" ")) +
    ")"
  '
}

# 1. Print the initial state immediately when Eww starts
generate_yuck

# 2. Listen to Niri's continuous event stream to trigger instant updates
niri msg --json event-stream | while read -r event; do
  # Extract the type of event occurring
  event_type=$(echo "$event" | jq -r 'keys[0]')
  
  # Only redraw the bar if the event affects workspaces or windows
  case "$event_type" in
    Workspace*|Window*|WorkspacesChanged)
      generate_yuck
      ;;
  esac
done
