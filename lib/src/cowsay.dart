class CowSayBuilder {
  List<String> cowSays = new List<String>();
  int leftPadding = 2;
  int rightPadding = 2;
  String horizontalLineChar = '-';
  String verticalLineChar = '|';
  String topLeftCornerChar = '/';
  String topRightCornerChar = '\\';
  String bottomRightCornerChar = '/';
  String bottomLeftCornerChar = '\\';
  StringBuffer cowSayBuffer;
  int maxMessageLength = 25;
  int lookForSpaceBuffer = 10;
  
  writeln(newCowSay) {
    var textToAdd = newCowSay;
    while(textToAdd.length > maxMessageLength) {
      final startOfSearchIndex = maxMessageLength - lookForSpaceBuffer;

      var endOfSearchIndex = maxMessageLength + lookForSpaceBuffer;
      if (endOfSearchIndex >= textToAdd.length) endOfSearchIndex = textToAdd.length - 1;

      var splitAt = textToAdd.substring(startOfSearchIndex, endOfSearchIndex).indexOf(new RegExp(r' '));
      if (splitAt == -1) splitAt = maxMessageLength;
      splitAt += startOfSearchIndex;

      cowSays.add(textToAdd.substring(0, splitAt));
      textToAdd = textToAdd.substring(splitAt);
      if (textToAdd.substring(0, 1) == ' ') textToAdd = textToAdd.substring(1);
    }
    cowSays.add(textToAdd);
  }
  
  toCowSay() {
    cowSayBuffer = new StringBuffer();
    var width = calculateWidth();

    drawHorizontalLine(width);

    for(var i = 0; i < cowSays.length; i++) {
      var cs = cowSays[i];
      var formattedSay = new StringBuffer();
      formattedSay.write((i == 0)?topLeftCornerChar:verticalLineChar);
      
      var paddedSay = cs.padLeft(cs.length + leftPadding);
      paddedSay = paddedSay.padRight(width.round());
      
      formattedSay.write(paddedSay);
      formattedSay.write((i == 0)?topRightCornerChar:verticalLineChar);
      
      cowSayBuffer.writeln(formattedSay);
    }
    
    drawBottomOfSpeechBubble(width);
    
    drawCow();
    
    return cowSayBuffer.toString();
  }
  
  int calculateWidth() {
    var longestLine = 0;
    
    cowSays.forEach((cs) {
      var bufferedLength = ((cs.length + leftPadding + rightPadding) * 1.2).round();
      if (longestLine < bufferedLength) {
        longestLine = bufferedLength;
      }
    });
    
    return longestLine;
  }
  
  void drawHorizontalLine(int width) {
    for (var i = 0; i < (leftPadding / 2).round(); i++) cowSayBuffer.write(' ');
    for (var i = 0; i < width; i++) cowSayBuffer.write('-');
    cowSayBuffer.writeln('');
  }
  
  void drawBottomOfSpeechBubble(int width) {
    cowSayBuffer.write(bottomLeftCornerChar);
    
    for (var i = 0; i < width; i++) cowSayBuffer.write(' ');
    
    cowSayBuffer.write(bottomRightCornerChar);
    cowSayBuffer.writeln();

    drawHorizontalLine(width);
  }
  
  void drawCow() {
    var padding = '';
    padding = padding.padLeft(leftPadding);
    
    cowSayBuffer.writeln('$padding\\   ^__^');
    cowSayBuffer.writeln('$padding \\  (oo)\\_______');
    cowSayBuffer.writeln('$padding    (__)\\       )\\/\\');
    cowSayBuffer.writeln('$padding        ||----w |');
    cowSayBuffer.writeln('$padding        ||     ||');
  }
}
