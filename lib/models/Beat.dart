class Beat {

  // instance variables
  // TODO: add dotted values for each of these
  int value; // note value: 1 - whole, 2 - half, 4 - quarter, 8 - eighth, 16 - sixteenth
  int sound; // if -1, play SystemSound : else play midi equivalent
  Duration beatDuration; // the actual amount ms

  // constructor
  Beat(this.value, this.sound) { beatDuration = Duration(); /* init */ }

  // methods
  void setSound(int toSet) { sound = toSet; }
  void setValue(int toSet, int bottomTimeSignature, Duration tempoDuration) {
    value = toSet; setBeatDuration(bottomTimeSignature, tempoDuration);
  }


  void setBeatDuration(int bottomTimeSignature, Duration tempoDuration) {

    // if time signature is * / 4 [common time]
    if (bottomTimeSignature == 4) {
      switch (value) {
        case 1: beatDuration = tempoDuration * 4; break;
        case 2: beatDuration = tempoDuration * 2; break;
        case 4: beatDuration = tempoDuration;     break;
        case 8:  beatDuration = tempoDuration ~/ 2; break;
        case 16: beatDuration = tempoDuration ~/ 4; break;
        default: print("Invalid Value");       break;
      }
    }

    // if time signature is * / 8 [duple meter]
    else if (bottomTimeSignature == 8) {
      switch (value) {
        case 1: beatDuration = tempoDuration * 8; break;
        case 2: beatDuration = tempoDuration * 4; break;
        case 4: beatDuration = tempoDuration * 2; break;
        case 8: beatDuration = tempoDuration;     break;
        case 16: beatDuration = tempoDuration ~/ 2; break;
        default: print("Invalid Value");       break;
      }
    }

    // if time signature is * / 2 [cut time]
    else if (bottomTimeSignature == 2) {
      switch (value) {
        case 1: beatDuration = tempoDuration * 2; break;
        case 2: beatDuration = tempoDuration; break;
        case 4: beatDuration = tempoDuration ~/ 2; break;
        case 8: beatDuration = tempoDuration ~/ 4; break;
        case 16: beatDuration = tempoDuration ~/ 8; break;
        default: print("Invalid Value");       break;
      }
    }


  }


  @override
  String toString() {
    // TODO: implement toString
    return value.toString();
  }
}