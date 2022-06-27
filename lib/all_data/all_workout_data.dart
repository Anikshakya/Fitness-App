var fitnessWorkouts = [
  {
    "image": "images/warmup1.jpg",
    "title": "4-min Warm-Up",
    "desc": "Build basic strength and learn fundamental exrcises",
  },
  {
    "image": "images/workout1.jpg",
    "title": "7-min Full-Body Workup",
    "desc": "Keep full-body in a good shape and build strength.",
  },
  {
    "image": "images/workout1.jpg",
    "title": "10-min Full-Body Workup",
    "desc": "Strength and keep your full body in a good shape.",
  },
  {
    "image": "images/meditation.jpg",
    "title": "10-min Meditation",
    "desc": "Keep your mind fresh and healthyand develop positiveness.",
  },
];

var allWorkoutData = [
  //--------------------All EXERCISES--------------------
  //----Push-Ups----
  {
    "url": "images/standardpushup.jpg",
    "name": "Standard Push-Up",
    "time_count": "00:18",
    "vidUrl": "videos/pushup.mp4",
    'type': 'Push-Ups'
  },
  {
    "url": "images/militarypushup.jpg",
    "name": "Military Push-Up",
    "time_count": "00:18",
    'type': 'Push-Ups'
  },
  {
    "url": "images/wallpushup.jpg",
    "name": "Wall Push-Up",
    "time_count": "00:18",
    'type': 'Push-Ups'
  },
  {
    "url": "images/diamondpushup.jpg",
    "name": "Diamond Push-Up",
    "time_count": "00:18",
    'type': 'Push-Ups'
  },
  {
    "url": "images/onelegpushup.jpg",
    "name": "One leg Push-Up",
    "time_count": "00:18",
    'type': 'Push-Ups'
  },
  {
    "url": "images/onearmpushup.jpg",
    "name": "One Arm Push-Up",
    "time_count": "00:18",
    'type': 'Push-Ups'
  },
  {
    "url": "images/bodyelevated.jpg",
    "name": "Feet Elevated",
    "time_count": "00:18",
    'type': 'Push-Ups'
  },
  {
    "url": "images/bodyelevated.jpg",
    "name": "Body Elevated",
    "time_count": "00:18",
    'type': 'Push-Ups'
  },
  //----Planks-----
  {
    "url": "images/plank.jpg",
    "name": "Standard Plank",
    "time_count": "00:20",
    'type': 'Planks',
    'description':
        'This is just a test the real data is comming soon. ahakdfadfjashajgdsfjgajgdjgajgdsjajgdhfgagsdjfajgdgfagjfdajgsjfdfjagjsdgfja',
  },
  //----Squats----
  {
    "url": "images/squats.jpg",
    "name": "Standard Squats",
    "time_count": "00:20",
    'type': 'Squats',
    'description':
        'This is just a test the real data is comming soon. ahakdfadfjashajgdsfjgajgdjgajgdsjajgdhfgagsdjfajgdgfagjfdajgsjfdfjagjsdgfja',
  },
  //----Burpees----
  {
    "url": "images/squats.jpg",
    "name": "Standard Burpees",
    "time_count": "00:20",
    'type': 'Burpees',
    'description':
        'This is just a test the real data is comming soon. ahakdfadfjashajgdsfjgajgdjgajgdsjajgdhfgagsdjfajgdgfagjfdajgsjfdfjagjsdgfja',
  },
  //----Stretching----
  {
    "url": "images/Shoulder_Stretch.jpg",
    "name": "Shoulder  Stretch",
    "time_count": "00:18",
    'type': 'Stretching'
  },
  {
    "url": "images/Toe_Stretch.jpg",
    "name": "Toe Stretch",
    "time_count": "00:18",
    'type': 'Stretching'
  },
  {
    "url": "images/Samson_Stretch.jpg",
    "name": "Samson Stretch",
    "time_count": "00:18",
    'type': 'Stretching'
  },
  {
    "url": "images/Butterfly_Stretch.jpg",
    "name": "Butterfly Stretch",
    "time_count": "00:18",
    'type': 'Stretching'
  },
  {
    "url": "images/Cobra_Stretch.jpg",
    "name": "Cobra Stretch",
    "time_count": "00:18",
    'type': 'Stretching'
  },
  {
    "url": "images/Quadriceps_Stretch.jpg",
    "name": "Quadriceps Stretch",
    "time_count": "00:18",
    'type': 'Stretching'
  },

  //----Crunches----
  {
    "url": "images/crunches.jpg",
    "name": "Standard Crunches",
    "time_count": "00:20",
    'type': 'Crunches',
    'description':
        'This is just a test the real data is comming soon. ahakdfadfjashajgdsfjgajgdjgajgdsjajgdhfgagsdjfajgdgfagjfdajgsjfdfjagjsdgfja',
  },
  //----Skipping----
  {
    "url": "images/skipping.jpg",
    "name": "...Skippng",
    "time_count": "00:20",
    'type': 'Skipping'
  },
  {
    "url": "images/skipping.jpg",
    "name": "...Skippng",
    "time_count": "00:20",
    'type': 'Skipping'
  },
  {
    "url": "images/skipping.jpg",
    "name": "...Skippng",
    "time_count": "00:20",
    'type': 'Skipping'
  },
  {
    "url": "images/skipping.jpg",
    "name": "...Skippng",
    "time_count": "00:20",
    'type': 'Skipping'
  },
  {
    "url": "images/skipping.jpg",
    "name": "...Skippng",
    "time_count": "00:20",
    'type': 'Skipping'
  },
  //----Yoga----
  {
    "url": "images/vinyasa.jpg",
    "name": "Vinyasa Yoga",
    "time_count": "00:20",
    'type': 'Yoga'
  },
  {
    "url": "images/hatha.jpg",
    "name": "Hatha yoga",
    "time_count": "00:20",
    'type': 'Yoga'
  },
  {
    "url": "images/Iyengar_yoga.jpg",
    "name": "Iyengar yoga",
    "time_count": "00:20",
    'type': 'Yoga'
  },
  {
    "url": "images/vinyasa.jpg",
    "name": "Vinyasa Yoga",
    "time_count": "00:20",
    'type': 'Yoga'
  },
  {
    "url": "images/vinyasa.jpg",
    "name": "Vinyasa Yoga",
    "time_count": "00:20",
    'type': 'Yoga'
  },
  //--------------------ALL WORKOUTS--------------------
  //----Arms----
  {
    "url": "images/arms.jpg",
    "name": "Arm Raise",
    "time_count": "00:30",
    'type': 'Arms',
    'description':
        'Stand on the floor with your arms extended straight forward at shoulder height.\n\nRaise your arms above your head. Return to the start position and repeat.',
  },
  {
    "url": "images/arms.jpg",
    "name": "Side Arm Raise",
    "time_count": "00:30",
    'type': 'Arms',
    'description':
        'Stand with your feet shoulder width apart. \n\nRaise your arms to the side at shoulders height, then put them down. \n\nRepeat the exercise. Keep your arms straight during the exercise.',
  },
  {
    "url": "images/arms.jpg",
    "name": "Triceps Dips",
    "time_count": "x10",
    'type': 'Arms',
    'description':
        'For the start position, sit on the chair. Then move your hip off the chair with your hands holding the edge of the chair. \n\nSlowly bend and stretch your arms to make your body go up and down. This is a great exersice for the triceps.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Arm circles clockwise",
    "time_count": "00:30",
    'type': 'Arms',
    'description':
        'Stand on the floor with your arms extended straight out to the sides of shoulder heigh. \n\nMove your arms clockwise in circles fast. \n\nTry to do it fasr as you can. \n\nIt\'s a great exrcise for the deltoid muscle.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Arm circles counterclockwise",
    "time_count": "00:30",
    'type': 'Arms',
    'description':
        'Stand on the floor with your arms extended straight out to the sides of shoulder heigh. \n\nMove your arms counterclockwise in circles fast. \n\nTry to do it fasr as you can. \n\nIt\'s a great exrcise for the deltoid muscle. '
  },
  {
    "url": "images/arms.jpg",
    "name": "Diamond Push-Ups",
    "time_count": "x6",
    'type': 'Arms',
    'description':
        'Start in the push-up position. Make a diamond shape with your forefinger and thumbs together under your chest. \n\nThen push your body up and down. Remember to keep your bady straight.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Jumping Jacks",
    "time_count": "00:20",
    'type': 'Arms',
    'description':
        'Start with your feet together and your arms by your sides, then jump up with your feet apart and your hands overhead. \n\nReturn to the start position then do the next rep. This exercise provides a fill-body workout and works all your large muscle group.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Chest presure pulse",
    "time_count": "00:16",
    'type': 'Arms',
    'description':
        'Hold your forearms together at shoulder height and bend your elbows with your hands together to make an \'L\' shape. \n\nThen lift your forearms up and down.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Leg Barbell curl left",
    "time_count": "x8",
    'type': 'Arms',
    'description':
        'Stand against a wall. Lift your right leg up, lean forward and grab underneath your right ankle with your left hand.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Leg Barbell curl right",
    "time_count": "x8",
    'type': 'Arms',
    'description':
        'Stand against a wall. Lift your left leg up, lean forward and grab underneath your left ankle with your right hand.'
  },

  {
    "url": "images/arms.jpg",
    "name": "Punches",
    "time_count": "00:30",
    'type': 'Arms',
    'description':
        'Stand with one of your legs foreard and your knees bent sliightly. Bend your elbows and clench your fists in front of your face. \n\nExtend one arm forward eith palm facing the floor. Take the arm back and repeat with the other arm.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Push-Ups",
    "time_count": "x10",
    'type': 'Arms',
    'description':
        'Lay prone on the ground with arms suppoorting your body. \n\nKeep your body with your arms. \n\nThis exercise works the chest, shoulders, triceps, back and legs.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Inchworms",
    "time_count": "x8",
    'type': 'Arms',
    'description':
        'Start with your feet shoulder width apart. \n\nBend your body and walk your hands in front of you as you can, then walk your hands back. Repeat the exrcise.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Wall Push-Ups",
    "time_count": "x12",
    'type': 'Arms',
    'description':
        'Stand in front of a wall one big step away from it. Then put your hands out straight towards the wall and lean against it. Lift your heels. \n\nSlowly bend your elbows and oress your upper bofy toeards the wall. Push back and repeat the exercise. Remember to keep your body straight.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Triceps Stretch Left",
    "time_count": "00:30",
    'type': 'Arms',
    'description':
        'Put your left hand on your back, use your right hand to grab your left elbow and gently pull it. Hold this position for a few seconds.'
  },

  {
    "url": "images/arms.jpg",
    "name": "Triceps Stretch Right",
    "time_count": "00:30",
    'type': 'Arms',
    'description':
        'Put your right hand on your back, use your left hand to grab your right elbow and gently pull it. Hold this position for a few seconds.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Standing Biceps Stretch Left",
    "time_count": "00:30",
    'type': 'Arms',
    'description':
        'Stand with your left arm close to a wall. Extend your left arm and put your left hand on the wll, then gently turn your body to the right.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Standing Biceps Stretch Right",
    "time_count": "00:30",
    'type': 'Arms',
    'description':
        'Stand with your right arm close to a wall. Extend your right arm and put your right hand on the wll, then gently turn your body to the left.'
  },

  //-----CHEST----
  {
    "url": "images/chest.jpg",
    "name": "Jumping Jacks",
    "time_count": "00:30",
    'type': 'Chest',
    'description':
        'Start with your feet together and your arms by your sides, then jump up with your feet apart and your hands overhead. \n\nReturn to the start position then do the next rep. This exercise provides a fill-body workout and works all your large muscle group.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Incline Push-Ups",
    "time_count": "x6",
    'type': 'Chest',
    'description':
        'Start in the regular push-up position but with your hands elevated on a chair or bench. \n\nThen push your body up and down using your arm strength. \n\nRemember to keep your body straight.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Push-Ups",
    "time_count": "x4",
    'type': 'Chest',
    'description':
        'Lay prone on the ground with arms suppoorting your body. \n\nKeep your body with your arms. \n\nThis exercise works the chest, shoulders, triceps, back and legs.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Wide Arm Push-Ups",
    "time_count": "x4",
    'type': 'Chest',
    'description':
        'Start in the regular push-up position but with your hands spread wider than your shoulders. \n\nThen push your body up and down. Remember to keep your body straight.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Triceps Dips",
    "time_count": "x6",
    'type': 'Chest',
    'description':
        'For the start position, sit on the chair. Then move your hip off the chair with your hands holding the edge of the chair. \n\nSlowly bend and stretch your arms to make your body do up and down. This is a great exercise for the triceps.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Wide Arm Push-Ups",
    "time_count": "x4",
    'type': 'Chest',
    'description':
        'Start in the regular push-up position but with your hands spread wider than your shoulders. \n\nThen push your body up and down. Remember to keep your body straight.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Incline Push-Ups",
    "time_count": "x6",
    'type': 'Chest',
    'description':
        'Start in the regular push-up position but with your hands elevated on a chair or bench. \n\nThen push your body up and down using your arm strength. \n\nRemember to keep your body straight.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Triceps Dips",
    "time_count": "x6",
    'type': 'Chest',
    'description':
        'For the start position, sit on the chair. Then move your hip off the chair with your hands holding the edge of the chair. \n\nSlowly bend and stretch your arms to make your body do up and down. This is a great exercise for the triceps.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Knee Push-Ups",
    "time_count": "x4",
    'type': 'Chest',
    'description':
        'Start in the regular push-up position, then let your knees touch the floor and raise your feet up off the floor. \n\nNext push your body up and down.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Cobra Stretch",
    "time_count": "00:20",
    'type': 'Chest',
    'description':
        'Lie down on your stomach and bend your elbows with your hands beneath your shoulders. \n\nThen push your chest up off the ground as far as possible. Hold this position for seconds.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Chest Stretch",
    "time_count": "00:20",
    'type': 'Chest',
    'description':
        'Find a doorway, take a lunge position in the doorway with your arms on the doorframe and your elbows a little lower than your shoulders, then slowly bring your chest forward. \n\nHold this position for 30-40 seconds. Then slowly come out of it, bring your arms down and do a couple of shoulder rolls. \n\nDon\'t pull your head forward, and keep your neck relaxed.'
  },

  //-----ABS----
  {
    "url": "images/abs.jpg",
    "name": "Jumping Jacks",
    "time_count": "00:20",
    'type': 'Abs',
    'description':
        'Start with your feet together and your arms by your sides, then jump up with your feet apart and your hands overhead. \n\nReturn to the start position then do the next rep. This exercise provides a fill-body workout and works all your large muscle group.'
  },
  {
    "url": "images/abs.jpg",
    "name": "Abdominal Crunches",
    "time_count": "x16",
    'type': 'Abs',
    'description':
        'Lie on your back with your knees bent and your arms stretched foward. \n\nThen lift your upper body off the floor. Hold for a few seconds and slowly return. \n\nIt primarily works the retus abdominis muscle and the obliques.'
  },
  {
    "url": "images/abs.jpg",
    "name": "Russian Twist",
    "time_count": "x20",
    'type': 'Abs',
    'description':
        'Sit on the floor with your knees bent, feel lifted a little bit and back tilted backwards. \n\nThen hold your hands together and twist from side to side.'
  },
  {
    "url": "images/abs.jpg",
    "name": "Mountain climber",
    "time_count": "x16",
    'type': 'Abs',
    'description':
        'Start in the push-up position Bend your right knees towards your chest and keep your left leg straight, then quickly switch from one leg to the other. \n\nThis exercise strengthens multiple muscle groups.'
  },
  {
    "url": "images/abs.jpg",
    "name": "Heel Touch",
    "time_count": "x20",
    'type': 'Abs',
    'description':
        'Lie on the ground with your legs bent and your arms by your sides. \n\nSlightly lift your upper body off the floor and make your hands alternately reach your heels.'
  },
  {
    "url": "images/abs.jpg",
    "name": "Leg Raises",
    "time_count": "x16",
    'type': 'Abs',
    'description':
        'Lie down on your back, and push your hands beneath you hips for support. \n\nThen lift your leg up until they form a right angle with the floor. \n\nSlowly bring your leg back down and repeat the exercise.'
  },
  {
    "url": "images/abs.jpg",
    "name": "Plank",
    "time_count": "00:20",
    'type': 'Abs',
    'description':
        'Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can. \n\nThis exercise strenghtens the abdomen, back and shoulders.'
  },
  {
    "url": "images/abs.jpg",
    "name": "Abdominal Crunches",
    "time_count": "x12",
    'type': 'Abs',
    'description':
        'Lie on your back with your knees bent and your arms stretched foward. \n\nThen lift your upper body off the floor. Hold for a few seconds and slowly return. \n\nIt primarily works the retus abdominis muscle and the obliques.'
  },
  {
    "url": "images/abs.jpg",
    "name": "Russian Twist",
    "time_count": "x32",
    'type': 'Abs',
    'description':
        'Sit on the floor with your knees bent, feel lifted a little bit and back tilted backwards. \n\nThen hold your hands together and twist from side to side.'
  },
  {
    "url": "images/abs.jpg",
    "name": "Mountain climber",
    "time_count": "x12",
    'type': 'Abs',
    'description':
        'Start in the push-up position Bend your right knees towards your chest and keep your left leg straight, then quickly switch from one leg to the other. \n\nThis exercise strengthens multiple muscle groups.'
  },
  {
    "url": "images/abs.jpg",
    "name": "Heel Touch",
    "time_count": "x20",
    'type': 'Abs',
    'description':
        'Lie on the ground with your legs bent and your arms by your sides. \n\nSlightly lift your upper body off the floor and make your hands alternately reach your heels.'
  },
  {
    "url": "images/abs.jpg",
    "name": "Leg Raises",
    "time_count": "x14",
    'type': 'Abs',
    'description':
        'Lie down on your back, and push your hands beneath you hips for support. \n\nThen lift your leg up until they form a right angle with the floor. \n\nSlowly bring your leg back down and repeat the exercise.'
  },
  {
    "url": "images/abs.jpg",
    "name": "Plank",
    "time_count": "00:30",
    'type': 'Abs',
    'description':
        'Lie on the floor with your toes and forearms on the ground. Keep your body straight and hold this position as long as you can. \n\nThis exercise strenghtens the abdomen, back and shoulders.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Cobra Stretch",
    "time_count": "00:30",
    'type': 'Abs',
    'description':
        'Lie down on your stomach and bend your elbows with your hands beneath your shoulders. \n\nThen push your chest up off the ground as far as possible. Hold this position for seconds.'
  },

  //-----Butt & Legs
  {
    "url": "images/legs&butt.jpg",
    "name": "Side Hop",
    "time_count": "00:30",
    'type': 'Butt & Legs',
    'description':
        'Stand on the floor, put your hands in front of you and hop from side to side.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Squats",
    "time_count": "x12",
    'type': 'Butt & Legs',
    'description':
        'Stand with your feet shoulder width apart and your arms stretched forward, then lower your body until your thighs are parallel with the floor. \n\nYour knees should be extended in the same direction as your toes. Return to the start position and do the next rep. \n\nThis work the thighs, hips buttocks, quads, hamstrings and lower body.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Squats",
    "time_count": "x12",
    'type': 'Butt & Legs',
    'description':
        'Stand with your feet shoulder width apart and your arms stretched forward, then lower your body until your thighs are parallel with the floor. \n\nYour knees should be extended in the same direction as your toes. Return to the start position and do the next rep. \n\nThis work the thighs, hips buttocks, quads, hamstrings and lower body.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Side-Lying leg Lift Left",
    "time_count": "x12",
    'type': 'Butt & Legs',
    'description':
        'Lie down on your side with your head rested on your right arm. Lift your upper leg up and return to the start position. \n\nMake sure your let leg goes straight up and down during the exercise. \n\nIt\'s a great exercise for the gluteus.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Side-Lying leg Lift Right",
    "time_count": "x12",
    'type': 'Butt & Legs',
    'description':
        'Lie down on your side with your head rested on your left arm. Lift your upper leg up and return to the start position. \n\nMake sure your let leg goes straight up and down during the exercise. \n\nIt\'s a great exercise for the gluteus.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Side-Lying leg Lift Left",
    "time_count": "x12",
    'type': 'Butt & Legs',
    'description':
        'Lie down on your side with your head rested on your right arm. Lift your upper leg up and return to the start position. \n\nMake sure your let leg goes straight up and down during the exercise. \n\nIt\'s a great exercise for the gluteus.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Side-Lying leg Lift Right",
    "time_count": "x12",
    'type': 'Butt & Legs',
    'description':
        'Lie down on your side with your head rested on your left arm. Lift your upper leg up and return to the start position. \n\nMake sure your let leg goes straight up and down during the exercise. \n\nIt\'s a great exercise for the gluteus.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Backward Lunges",
    "time_count": "x14",
    'type': 'Butt & Legs',
    'description':
        'Stand with your feet shoulder width apart and your hands on your hips. \n\nStep a big step backwards with your right leg and lower your body until your left thigh is parallel to the floor. Return and repeat the other side.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Backward Lunges",
    "time_count": "x14",
    'type': 'Butt & Legs',
    'description':
        'Stand with your feet shoulder width apart and your hands on your hips. \n\nStep a big step backwards with your right leg and lower your body until your left thigh is parallel to the floor. Return and repeat the other side.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Donkey Kicks Right",
    "time_count": "x16",
    'type': 'Butt & Legs',
    'description':
        'Start on the floor with your knees under butt and your hands under shoulders. \n\nThen lift your right leg and squeeze your butt as much as you can. Go back to the start position and repeat the exercise.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Donkey Kicks Left",
    "time_count": "x16",
    'type': 'Butt & Legs',
    'description':
        'Start on the floor with your knees under butt and your hands under shoulders. \n\nThen lift your left leg and squeeze your butt as much as you can. Go back to the start position and repeat the exercise.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Donkey Kicks Right",
    "time_count": "x16",
    'type': 'Butt & Legs',
    'description':
        'Start on the floor with your knees under butt and your hands under shoulders. \n\nThen lift your right leg and squeeze your butt as much as you can. Go back to the start position and repeat the exercise.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Donkey Kicks Left",
    "time_count": "x16",
    'type': 'Butt & Legs',
    'description':
        'Start on the floor with your knees under butt and your hands under shoulders. \n\nThen lift your left leg and squeeze your butt as much as you can. Go back to the start position and repeat the exercise.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Left Quad Stretch with wall",
    "time_count": "00:30",
    'type': 'Butt & Legs',
    'description':
        'Stand with your right hands on the wall. Bnd your left leg and grasp your ankle or toes to bring your left calf close to your left thigh. Hold this position.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Right Quad Stretch with wall",
    "time_count": "00:30",
    'type': 'Butt & Legs',
    'description':
        'Stand with your left hands on the wall. Bnd your right leg and grasp your ankle or toes to bring your right calf close to your right thigh. Hold this position.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Knee to Chest Stretch Left",
    "time_count": "00:30",
    'type': 'Butt & Legs',
    'description':
        'Lie on the floor with your legs extended. Lift your left knee up and grab it with both hands. \n\nPull your left knee towards your chest as much as you can while keeping your right leg straight on the ground. \n\nHold this position for a few seconds.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Knee to Chest Stretch Right",
    "time_count": "00:30",
    'type': 'Butt & Legs',
    'description':
        'Lie on the floor with your right extended. Lift your right knee up and grab it with both hands. \n\nPull your right knee towards your chest as much as you can while keeping your left leg straight on the ground. \n\nHold this position for a few seconds.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Sumo Squat Calf Raise with wall",
    "time_count": "x12",
    'type': 'Butt & Legs',
    'description':
        'Stand with your hands on the wall and your feet littel wider than shoulder width apart. \n\nLower your body until your thighs are parallel to the floor. Lift your heels up and down.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Sumo Squat Calf Raise with wall",
    "time_count": "x12",
    'type': 'Butt & Legs',
    'description':
        'Stand with your hands on the wall and your feet littel wider than shoulder width apart. \n\nLower your body until your thighs are parallel to the floor. Lift your heels up and down.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Calf Stretch Left",
    "time_count": "00:30",
    'type': 'Butt & Legs',
    'description':
        'Stand one big step away in front of a wall. Step forward with your right foot and push the wall with your hands. \n\nPlease make sure your left leg is fully extended and you can feel your left calf stretching. Holding this position for a few seconds.'
  },
  {
    "url": "images/legs&butt.jpg",
    "name": "Calf Stretch Right",
    "time_count": "00:30",
    'type': 'Butt & Legs',
    'description':
        'Stand one big step away in front of a wall. Step forward with your left foot and push the wall with your hands. \n\nPlease make sure your right leg is fully extended and you can feel your right calf stretching. Holding this position for a few seconds.'
  },
  //-----Shoulders and Back----
  {
    "url": "images/arms.jpg",
    "name": "Jumping Jacks",
    "time_count": "00:30",
    'type': 'Shoulder & Back',
    'description':
        'Start with your feet together and your arms by your sides, then jump up with your feet apart and your hands overhead. \n\nReturn to the start position then do the next rep. This exercise provides a fill-body workout and works all your large muscle group.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Arm Raise",
    "time_count": "00:16",
    'type': 'Shoulder & Back',
    'description':
        'Stand on the floor with your arms extended straight forward at shoulder height. \n\nRaise your arms above your head. Return to the start position and repeat.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Rhomboid Pulls",
    "time_count": "x14",
    'type': 'Shoulder & Back',
    'description':
        'Stand with your feet shoulder with apart. \n\nRaise your arms parallel to the fground, and bend your elbows. Pull your elbows back and squeeze your shoulder blades. \n\nRepeat this exercise.'
  },
  {
    "url": "images/arms.jpg",
    "name": "Side Arm Raise",
    "time_count": "00:16",
    'type': 'Shoulder & Back',
    'description':
        'Stand with your feet shoulder width apart. \n\nRaise your arms to the side at shoulder height, then put them down. \n\nRepeat the exercise. Keep your arms straight during the exercise.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Knee Push-Ups",
    "time_count": "x12",
    'type': 'Shoulder & Back',
    'description':
        'Start in the regular push-up position, then let your knees touch the floor and raise your feet up off the floor. \n\nNext push your body up and down.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Cat Cow Pose",
    "time_count": "00:30",
    'type': 'Shoulder & Back',
    'description':
        'Start on all fours with your knees under your butt and your hands directly under your shoulders. \n\nThen take a breath and make your belly fall down, shoulders roll back and head come up towards the ceiling. \n\nAs you exhale, curve your back upward and let your head come doen. Repeat the exercise. Do this exercise slowly on each steps.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Prone Triceps Push-Ups",
    "time_count": "x14",
    'type': 'Shoulder & Back',
    'description':
        'Lie on the stomach with your hands underneath your shoulders and your elbows bent. \n\nSlightly raise your chest up, and then go back to the start position. \n\nRepeat this exercise.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Reclined Rhomboid Squeeze",
    "time_count": "x12",
    'type': 'Shoulder & Back',
    'description':
        'Sit with with wiht with withw with your knees bent. Slightly lean your upper body back. \n\nStretch arm on front of you, then pull your elbows back to make your elbows at a 90 degree ansle and squeeze your shoulder blades. \n\nRepeat this exercise.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Prone Triceps Push-Ups",
    "time_count": "x14",
    'type': 'Shoulder & Back',
    'description':
        'Lie on the stomach with your hands underneath your shoulders and your elbows bent. \n\nSlightly raise your chest up, and then go back to the start position. \n\nRepeat this exercise.'
  },
  {
    "url": "images/chest.jpg",
    "name": "Reclined Rhomboid Squeeze",
    "time_count": "x12",
    'type': 'Shoulder & Back',
    'description':
        'Sit with with wiht with withw with your knees bent. Slightly lean your upper body back. \n\nStretch arm on front of you, then pull your elbows back to make your elbows at a 90 degree ansle and squeeze your shoulder blades. \n\nRepeat this exercise.'
  },
];

var fitnessExercise = [
  {
    "image": "images/pushUp.jpg",
    "name": "Push-Ups",
    "exercises": "6 Exercises",
    "time": "1-2 min",
    "category": "Abs, Arms",
    "desc": "Strengthen arms and back workout."
  },
  {
    "image": "images/Stretching.jpg",
    "name": "Stretching",
    "exercises": "6 Exercises",
    "time": "1-2 min",
    "category": "Abs, Arms",
    "desc": "Build posters and improve flexibility of dull muscles."
  },
  {
    "image": "images/plank.jpg",
    "name": "Planks",
    "exercises": "6 Exercises",
    "time": "1-2 min",
    "category": "Abs, Arms",
    "desc": "Reduce stomach fat and strengthen arms."
  },
  {
    "image": "images/squats.jpg",
    "name": "Squats",
    "exercises": "6 Exercises",
    "time": "1-2 min",
    "category": "Abs, Arms",
    "desc": "Shape up and build Leg strength."
  },
  {
    "image": "images/burpees.jpg",
    "name": "Burpees",
    "exercises": "6 Exercises",
    "time": "1-2 min",
    "category": "Abs, Arms",
    "desc": "Burn full body fat and build up shape."
  },
  {
    "image": "images/crunches.jpg",
    "name": "Crunches",
    "exercises": "6 Exercises",
    "time": "1-2 min",
    "category": "Abs, Arms",
    "desc": "Burn stomach fat and build abs."
  },
  {
    "image": "images/skipping.jpg",
    "name": "Skipping",
    "exercises": "6 Exercises",
    "time": "1-2 min",
    "category": "Abs, Arms",
    "desc": "Build up stamina and stay healthy."
  },
  {
    "image": "images/yoga.jpg",
    "name": "Yoga",
    "exercises": "6 Exercises",
    "time": "1-2 min",
    "category": "Abs, Arms",
    "desc": "Build posters and enchance balance."
  },
];

var workoutItems = [
  {
    "name": "Yoga",
    "url": "images/mountainPose.jpg",
    "txt": "12 Exercises",
  },
  {
    "name": "Push-ups",
    "url": "images/pushups.jpg",
    "txt": "9 Exercises",
  },
  {
    "name": "Stretching",
    "url": "images/Yoga.jpg",
    "txt": "8 Exercises",
  },
  {
    "name": "Cardio",
    "url": "images/Cardio.jpg",
    "txt": "10 Exercises",
  },
  {
    "name": "Arms",
    "url": "images/Arms.jpg",
    "txt": "5 Exercises",
  },
  {
    "name": "Pilates",
    "url": "images/Pilates.jpg",
    "txt": "12 Exercises",
  },
  {
    "name": "Planks",
    "url": "images/Plank.jpg",
    "txt": "9 Exercises",
  },
  {
    "name": "Squats",
    "url": "images/squats.jpg",
    "txt": "9 Exercises",
  },
  {
    "name": "Lunges",
    "url": "images/Lunges.jpg",
    "txt": "9 Exercises",
  },
  {
    "name": "Abdominal",
    "url": "images/abdCrunches.jpg",
    "txt": "9 Exercises",
  },
];

var workoutList = [
  {
    "name": "Push-ups",
    "url": "images/pushups.jpg",
    "txt": "9 Exercises",
  },
  {
    "name": "Stretching",
    "url": "images/Stretching.jpg",
    "txt": "12 Exercises | 14min"
  },
  {
    "name": "Yoga",
    "url": "images/yoga.jpg",
    "txt": "8 Exercises | 12min",
  },
  {
    "name": "Cardio",
    "url": "images/Cardio.jpg",
    "txt": "10 Exercises | 8min",
  },
  {
    "name": "Squats",
    "url": "images/squats.jpg",
    "txt": "9 Exercises",
  },
  {
    "name": "Arms",
    "url": "images/arms.jpg",
    "txt": "5 Exercises | 10min",
  },
  {
    "name": "Pilates",
    "url": "images/Pilates.jpg",
    "txt": "12 Exercises | 13min"
  },
  {
    "name": "Planks",
    "url": "images/plank.jpg",
    "txt": "9 Exercises | 11min",
  },
  {
    "name": "Stretching",
    "url": "images/Stretching.jpg",
    "txt": "12 Exercises | 14min"
  },
  {
    "name": "Yoga",
    "url": "images/yoga.jpg",
    "txt": "8 Exercises | 12min",
  },
  {
    "name": "Cardio",
    "url": "images/Cardio.jpg",
    "txt": "10 Exercises | 8min",
  },
  {
    "name": "Arms",
    "url": "images/arms.jpg",
    "txt": "5 Exercises | 10min",
  },
  {
    "name": "Pilates",
    "url": "images/Pilates.jpg",
    "txt": "12 Exercises | 13min"
  },
  {
    "name": "Planks",
    "url": "images/plank.jpg",
    "txt": "9 Exercises | 11min",
  },
];

var yogaWorkouts = [
  {
    "url": "images/Toe_stretch.jpg",
    "name": "Vinyasa yoga.",
    "txt": "00:20",
    'type': 'Yoga'
  },
  {
    "url": "images/Toe_stretch.jpg",
    "name": "Hatha yoga",
    "txt": "00:20",
    'type': 'Yoga'
  },
  {
    "url": "images/Toe_stretch.jpg",
    "name": "Iyengar yoga",
    "txt": "00:20",
    'type': 'Yoga'
  },
  {
    "url": "images/Toe_stretch.jpg",
    "name": "Ashtanga yoga",
    "txt": "00:20",
    'type': 'Yoga'
  },
  {
    "url": "images/mountainPose.jpg",
    "name": "Bikram yoga",
    "txt": "00:18",
    'type': 'Yoga'
  },
  {
    "url": "images/mountainPose.jpg",
    "name": "Yin yoga",
    "txt": "00:18",
    'type': 'Yoga'
  },
];

var workouts = [
  {
    "title": "Arms",
    "image": "images/arms.jpg",
    "exercises": "12",
    "time": "10-14mins",
    "category": "Abs, Arms",
    "desc": "Build posters and improve flexibility of dull muscles."
  },
  {
    "title": "Butt & Legs",
    "image": "images/legs&butt.jpg",
    "exercises": "15",
    "time": "10-17mins",
    "category": "Abs, Arms",
    "desc": "Build posters and improve flexibility of dull muscles."
  },
  {
    "title": "Chest",
    "image": "images/chest.jpg",
    "exercises": "15",
    "time": "10-17mins",
    "category": "Abs, Arms",
    "desc": "Build posters and improve flexibility of dull muscles."
  },
  {
    "title": "Abs",
    "image": "images/abs.jpg",
    "exercises": "15",
    "time": "10-17mins",
    "category": "Abs, Arms",
    "desc": "Build posters and improve flexibility of dull muscles."
  },
  {
    "title": "Shoulder & Back",
    "image": "images/chest.jpg",
    "exercises": "15",
    "time": "10-17mins",
    "category": "Abs, Arms",
    "desc": "Build posters and improve flexibility of dull muscles."
  },
];

var allWorkoutsData = [
  {
    "image": "images/vinyasa.jpg",
    "name": "Vinyasa Yoga",
    "time": "00:20",
    "type": "Yoga",
    "video": "",
  },
];

class SpecificWorkouts {
  var workouts = [
    {
      "title": "Arms",
      "image": "images/arms.jpg",
      "exercises": "12",
      "time": "10-14mins",
      "category": "Abs, Arms",
      "desc": "Build posters and improve flexibility of dull muscles."
    },
    {
      "title": "Butt & Legs",
      "image": "images/legs&butt.jpg",
      "exercises": "15",
      "time": "10-17mins",
      "category": "Abs, Arms",
      "desc": "Build posters and improve flexibility of dull muscles."
    },
    {
      "title": "Chest",
      "image": "images/chest.jpg",
      "exercises": "15",
      "time": "10-17mins",
      "category": "Abs, Arms",
      "desc": "Build posters and improve flexibility of dull muscles."
    },
    {
      "title": "Abs",
      "image": "images/abs.jpg",
      "exercises": "15",
      "time": "10-17mins",
      "category": "Abs, Arms",
      "desc": "Build posters and improve flexibility of dull muscles."
    },
    {
      "title": "Shoulder & Back",
      "image": "images/chest.jpg",
      "exercises": "15",
      "time": "10-17mins",
      "category": "Abs, Arms",
      "desc": "Build posters and improve flexibility of dull muscles."
    },
  ];
}

var dummy = [
  {
    "image": "images/mountainPose.jpg",
    "name": "mountain",
  },
  {
    "image": "images/mountainPose.jpg",
    "name": "valley",
  },
  {
    "image": "images/mountainPose.jpg",
    "name": "aeroplane",
  },
  {
    "image": "images/mountainPose.jpg",
    "name": "something",
  },
  {
    "image": "images/mountainPose.jpg",
    "name": "something",
  },
  {
    "image": "images/mountainPose.jpg",
    "name": "something",
  }
];

var categoryList = [
  {
    "image": "images/mountainPose.jpg",
    "name": "Market",
  },
  {
    "image": "images/mountainPose.jpg",
    "name": "News",
  },
  {
    "image": "images/mountainPose.jpg",
    "name": "Games",
  },
  {
    "image": "images/mountainPose.jpg",
    "name": "Food",
  },
  {
    "image": "images/mountainPose.jpg",
    "name": "Sports",
  }
];
