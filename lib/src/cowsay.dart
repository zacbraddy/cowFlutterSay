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
  
  writeln(newCowSay) {
    cowSays.add(newCowSay);
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
