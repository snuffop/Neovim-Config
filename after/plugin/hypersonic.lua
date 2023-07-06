local status_ok, hypersonic = pcall(require, "hypersonic")
if not status_ok then
  return
end

hypersonic.setup{}
