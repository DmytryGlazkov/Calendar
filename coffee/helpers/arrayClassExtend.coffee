Array.prototype.chunk = (pieces) ->
  pieces = pieces || 2
  len = @length
  mid = (len/pieces)
  chunks = []
  start = 0
  for i in [0..pieces]
    last = start+mid
    if (!len%pieces >= i)
      last = last-1
    chunks.push(@slice(start,last+1) || [])
    start = last+1
  chunks