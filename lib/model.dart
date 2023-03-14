///ISO Card formats
///https://www.iso.org/standard/70483.html
enum OverlayFormat {
  ///Most banking cards and ID cards
  cardID1,

  ///French and other ID cards. Visas.
  cardID2,

  ///United States government ID cards
  cardID3,

  ///SIM cards
  simID000,

  // TW Household Registration from 25cm high
  householdRegistration,

  // TW Card ID from 25cm high
  cardID4,

  // 2 inch photo
  photo,
}

enum OverlayOrientation { landscape, portrait }

abstract class OverlayModel {
  ///ratio between maximum allowable lengths of shortest and longest sides
  double? ratio;

  ///ratio between maximum allowable radius and maximum allowable length of shortest side
  double? cornerRadius;

  ///ratio between maximum allowable radius and maximum allowable length of shortest side
  double? widthTimes;

  ///natural orientation for overlay
  OverlayOrientation? orientation;
}

class CardOverlay implements OverlayModel {
  CardOverlay({
    this.ratio = 1.5,
    this.cornerRadius = 0.66,
    this.widthTimes,
    this.orientation = OverlayOrientation.landscape,
  });

  @override
  double? ratio;
  @override
  double? cornerRadius;
  @override
  double? widthTimes;
  @override
  OverlayOrientation? orientation;

  static byFormat(OverlayFormat format) {
    switch (format) {
      case (OverlayFormat.cardID1):
        return CardOverlay(ratio: 1.59, cornerRadius: 0.064);
      case (OverlayFormat.cardID2):
        return CardOverlay(ratio: 1.42, cornerRadius: 0.067);
      case (OverlayFormat.cardID3):
        return CardOverlay(ratio: 1.42, cornerRadius: 0.057);
      case (OverlayFormat.simID000):
        return CardOverlay(ratio: 1.66, cornerRadius: 0.073);
      case (OverlayFormat.householdRegistration):
        return CardOverlay(ratio: 5, cornerRadius: 0.073);
      case (OverlayFormat.cardID4):
        return CardOverlay(ratio: 1.59, cornerRadius: 0.064, widthTimes: .5);
      case (OverlayFormat.photo):
        return CardOverlay(ratio: 0.7, cornerRadius: 0.064, widthTimes: .27);
    }
  }
}
