/// Identifies which service category is shown so the listing
/// can pick the right card style and detail behavior.
enum ServiceType { transfers, tours, transitTours, meetGreet, hotels }

/// Map from service tab / home titles to [ServiceType].
ServiceType serviceTypeFromTitle(String title) {
  switch (title) {
    case 'Transfers':
      return ServiceType.transfers;
    case 'Tours':
      return ServiceType.tours;
    case 'Transit Tours':
      return ServiceType.transitTours;
    case 'Meet & Greet':
      return ServiceType.meetGreet;
    case 'Hotels':
      return ServiceType.hotels;
    default:
      // Fallback – adjust if you prefer a different default.
      return ServiceType.transfers;
  }
}
