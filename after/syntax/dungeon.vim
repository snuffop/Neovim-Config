sign define Ok text=✓ texthl=dCorrect
sign define Bad text=✗ texthl=dWrong

syntax region dComment start=/#/ end=/\n/
"syntax region wWrong start=/===/ end=/===/ contains=dCorrect

highlight dWrong ctermfg=red guifg=red
highlight dCorrect ctermfg=green guifg=green 
highlight dComment ctermfg=cyan guifg=cyan


function! AddSigns()
  let dungeonSolutions = {
        \ '1': [
        \ 'In Codethia, land of lore,',
        \ 'A scribe named Vimar yearned for more.',
        \ 'In Notem village, quiet, mild,',
        \ 'Dreamed he of words that flowed so wild.',
        \ 'A scroll he found, old, tattered, worn,',
        \ 'Of Vim, an editor, power born.',
        \ 'With heart alight, his journey starts,',
        \ 'To master scripts and win his parts.',
        \ ],
        \ '2': [
        \ 'The butterfly fluttered around the blooming flowers in the garden.', 
        \ 'She wrote a letter to her friend who lived in another city.',
        \ 'The old car broke down on the way to the countryside.',
        \ 'He wore a bright green shirt to the party.',
        \ 'The children chased each other around the playground.',
        \ 'The meeting was scheduled for Monday morning.',
        \ 'The paint on the walls was starting to chip off.',
        \ 'She found a hidden gem tucked away in a small alley.',
        \ 'The puppies were playing with a ball in the backyard.',
        \ 'He couldn’t believe his eyes when he saw the score on his test.',
        \ 'The wind blew the leaves off the trees in the park.',
        \ 'She borrowed a book from the library to read over the weekend.',
        \ 'The chef added extra cheese to the pizza.',
        \ 'The artist painted a beautiful landscape of the mountains.',
        \ 'The loud music gave him a heaadache.',
        \ 'They went for a walk along the beach at sunset.',
        \ 'The heavy rain caused a flood in the basement.',
        \ 'She accidentally spilled coffee on her white shirt.',
        \ 'The students worked together on their group project.',
        \ 'He enjoyed a quiet evening by the fireplace, reading a good book.'
        \ ],
        \ '3': [
        \ 'The sun dipped below the horizon, casting a warm glow over the ocean.',
        \ 'She carefully placed the antique vase on the mantle, admiring its delicate design.',
        \ 'Walking through the forest, he marveled at the vibrant colors of the autumn leaves.',
        \ 'The aroma of freshly baked bread filled the kitchen, making everyone`s mouths water.',
        \ 'A sudden thunderstorm forced the picnic to move indoors, but the fun continued.',
        \ 'The cat curled up on the windowsill, basking in the afternoon sunlight.',
        \ ],
        \ '4': [
        \ 'A journey of a thousand miles begins with a single step',
        \ 'She quickly grabbed her coat and ran out the door',
        \ 'They decided to take the scenic route home after work',
        \ '    The dog barked loudly at the mailman every afternoon',
        \ 'He spent the entire day painting the fence in the backyard',
        \ '      Our vacation plans were disrupted by the sudden storm',
        \ 'The little girl sang beautifully at the school talent show',
        \ 'Reading books is a wonderful way to expand your imagination',
        \ '    Their team won the championship game in the final seconds',
        \ 'The concert was amazing, and the band played all night long',
        \ ],
        \ 'challenge1': [
        \ 'The quick brown fox jumps over the lazy dog.',
        \ 'The beach was quiet in the early morning, with only the sound of waves breaking.',
        \ 'This is a short sentence about nothing',
        \ 'The smell of fresh coffee filled the air, inviting everyone to the kitchen',
        \ 'The rain poured down, creating a rhythmic sound against the roof.',
        \ 'She found an old photograph in the attic, bringing back a flood of memories.',
        \ 'The city skyline was illuminated by the setting sun, casting long shadows',
        \ 'He enjoyed the challenge of solving complex puzzles in his free time',
        \ '       He wrote letters to his friends, preferring the personal touch over emails',
        \ 'The concert hall was filled with the sound of a grand piano playing a classic piece',
        \ '     She took a deep breath and stepped onto the stage, ready to give her speech',
        \ ],
        \ '5': [
        \ 'The quick brown fox jumps over the lazy dog near the lake.',
        \ 'She sells seashells by the seashore on a warm summer afternoon.',
        \ 'A journey of a thousand miles begins with a single step forward.',
        \ 'In the middle of difficulty lies opportunity for those who dare to seek.',
        \ 'The cat chased the mouse through the kitchen and into the living room.',
        \ 'He who laughs last laughs best, especially when the joke is on someone.',
        \ 'A penny saved is a penny earned, so save your money wisely.',
        \ 'Reading books opens up new worlds and expands your knowledge.',
        \ 'The early bird catches the worm, but the second mouse gets the cheese.',
        \ 'An apple a day keeps the doctor away, promoting good health.',
        \ ],
        \ '7': [
        \ '1. Sunset paints the sky in vibrant hues.',
        \ '2. Birds singing at dawn green the morning light.',
        \ '3. Whispers in the wind carry secrets untold.',
        \ '4. Raindrops on the roof create a soothing melody.',
        \ '5. Stars twinkle above us in the vast night sky.',
        \ '6. Snowflakes on my nose bring a chill to the air.',
        \ '1)',
        \ '2)',
        \ '3)',
        \ '4)',
        \ '5)',
        \ '6)',
        \ '7)',
        \ '8)',
        \ '9)',
        \ '10)',
        \ '11)',
        \ '12)',
        \ '13)',
        \ '14)',
        \ '15)',
        \ '16)',
        \ '17)',
        \ '18)',
        \ '19)',
        \ '20)',
        \ ],
        \ 'challenge2': [
        \ 'Hello world!',
        \ 'My name is Mark',
        \ 'The sun is rising',
        \ 'He plays the guitar',
        \ 'They walked to school',
        \ 'I lost my keys',
        \ 'The mountain trail was steep and challenging, but the view from the top was worth it',
        \ 'He loved experimenting with new recipes, always eager to try different cuisines',
        \ 'The library`s reading room was a haven of peace and quiet, perfect for studying',
        \ '1)',
        \ '2)',
        \ '3)',
        \ '4)',
        \ '5)',
        \ '25)',
        \ '24)',
        \ '23)',
        \ '22)',
        \ '21)',
        \ '20)',
        \ '19)',
        \ '18)',
        \ '100)',
        \ '101)',
        \ '102)',
        \ '103)',
        \ '104)',
        \ '105)',
        \ '106)',
        \ '107)',
        \ '108)',
        \ '109)',
        \ '110)',
        \ ],
        \ '8': [
        \ 'She painted the room a cheerful yellow, brightening up the entire house',
        \ 'He flipped through the pages of the old photo album, lost in memories of the past',
        \ 'The mountains in the distance were capped with snow, standing majestically against the blue sky',
        \ 'Her laughter echoed through the empty halls, bringing life to the abandoned building',
        \ 'They spent the afternoon planting flowers in the garden, enjoying the warm spring day',
        \ ],
        \ '9': [
        \ 'if (x == 1) { return true }',
        \ 'else if (x == 0) { return false }',
        \ 'print("Hello World")',
        \ '<a href="somelink.com">Somelink</a>',
        \ 'array[index]',
        \ 'The children chased each other around the playground, their giggles filling the air.',
        \ 'A gentle breeze rustled the leaves of the trees, creating a soothing sound.',
        \ 'He wrote her a letter every week, even though he knew she might never read them.',
        \ ],
        \ 'challenge3': [
        \ 'Hello world',
        \ 'foo bar',
        \ 'The sky turned gray',
        \ 'She won the race',
        \ 'The cake was delicious',
        \ 'He reads every night',
        \ 'If you look closely, (You)`ll see the tiny details in the artwork.',
        \ 'I (have) always enjoyed exploring new places and trying different foods.',
        \ 'The chef (made) a delicious meal that everyone enjoyed.',
        \ 'Her presentation was (amazing) and captivated the entire audience.',
        \ 'He`ve shown incredible (progress) in learning the new language.',
        \ 'You have made amazing progress',
        \ ],
        \ '10': [
        \ 'qux bar bar bar bar bar bar bar bar bar',
        \ ],
        \ '11': [
        \ 'Hello, Water bottle, Neovim, Syntax, Keyboard, Terminal, Linux, Windows, macOS',
        \ '1. "The sun set behind the mountains"',
        \ '2. "She loves reading mystery novels"',
        \ '3. "Coffee is my favorite morning drink"',
        \ '4. "The cat chased the laser pointer"',
        \ '5. "He plays the guitar very well"',
        \ '6. "Rainy days make me feel cozy"',
        \ '7. "The movie had an unexpected twist"',
        \ '8. "They walked along the beach at dawn"',
        \ '9. "The cake tasted absolutely delicious"',
        \ '10. "She solved the puzzle quickly"',
        \ ],
        \ '12': [
        \ 'He enjoys hiking in the forest.',
        \ 'The dog barked at the mailman.',
        \ 'She paints beautiful landscapes.',
        \ 'The concert was a huge success.',
        \ 'He wrote a poem for her.',
        \ 'The fireworks lit up the night sky.',
        \ 'They danced under the stars.',
        \ 'The book was hard to put down.',
        \ '{', '}'
        \ ],
        \ '13': [
        \ 'The flowers b`l`o`o`m`e`d in the garden.',
        \ 'HE W"A"T"C"H"E"D THE SUNSET IN SILENCE.',
        \ 'She sings in the choir every Sunday.',
        \ 'THE CHILDREN PLAYED IN THE PARK.',
        \ 'He built a b.i.r.d.h.o.u.s.e from scratch.',
        \ 'The soup was hot and SaVoRy.',
        \ 'SHE E,N,J,O,Y,S KNITTING SCARVES IN WINTER.',
        \ 'THEY VISITED THE MUSEUM ON SATURDAY.',
        \ 'The pizza was f\r\e\s\h out of the oven.',
        \ 'HE RUNS FIVE MILES EVERY MORNING.',
        \ ],
        \ 'challenge4': [
        \ 'The leaves rustled in the wind.',
        \ 'She won the chess tournament.',
        \ 'The snow covered the entire town.',
        \ 'He mastered the art of calligraphy.',
        \ 'The dog wagged its tail happily.',
        \ 'She loves watching documentaries.',
        \ 'The breeze was cool and refreshing.',
        \ 'He finished the marathon in record time.',
        \ 'The baby giggled at the funny faces.',
        \ 'She enjoyed the book`s unexpected ending.',
        \ 'The c-o-f-f-e-e was too hot to drink.',
        \ 'He wore a red hat to the p-a-r-t-y.',
        \ 'The cat s-l-e-p-t on the windowsill.',
        \ 'She f-o-u-n-d a note in the old book.',
        \ 'The bike ride was i-n-v-i-g-o-r-a-t-i-n-g.',
        \ 'camelCase',
        \ 'interestingBook',
        \ 'usefulFunction()',
        \ 'awesomeNeovim',
        \ 'vimMacros',
        \ 'waterBottle',
        \ 'terminalEmulator',
        \ 'someText',
        \ ]
        \ }

  let signid = 1
  let allCorrect = 1 
  let currfile = expand('%:t:r')

  if !has_key(dungeonSolutions, currfile)
    return
  endif

  let currSolution = dungeonSolutions[currfile]

  for linenum in range(1, line('$'))
    let linecontent = getline(linenum)

    let synID = synID(linenum, 1, 1)
    let synGroup = synIDattr(synID, 'name')
    if empty(linecontent) || synGroup ==# 'dComment'
      continue
    endif

    if index(currSolution, linecontent) != -1
      execute 'sign place '.signid.' line='.linenum.' name=Ok file='.currfile.'.dungeon'
    else
      let allCorrect = 0
      execute 'sign place '.signid.' line='.linenum.' name=Bad file='.currfile.'.dungeon'
    endif

    let signid += 1
  endfor

  if allCorrect == 1
    echo 'Well done!'
  endif
endfunction

augroup CheckLinesGroup
  autocmd!
  autocmd TextChanged,TextChangedI * call AddSigns()
augroup END

call AddSigns()
