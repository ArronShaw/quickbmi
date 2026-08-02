# QuickBMI

A native iPhone app that calculates Body Mass Index. The app itself is intentionally minimal — its real purpose is validating the full pipeline for shipping an app to the Apple App Store, end to end.

## Language

**BMI**:
Body Mass Index — a single number derived from height and weight (`weight_kg / height_m²`) used to place a person into a weight category.
_Avoid_: Score, rating, index (alone)

**BMI Category**:
One of four bands a BMI value falls into: Underweight, Normal, Overweight, Obese. Determined by fixed numeric thresholds on the BMI value.
_Avoid_: Result, status, class

**Unit System**:
The measurement system the user is currently entering height/weight in — either Imperial (pounds, feet/inches) or Metric (kilograms, centimeters). A toggle switches which one is active; it does not store or convert history, since no values persist between sessions.
_Avoid_: Units (alone, ambiguous between "unit system" and "a single unit")

## Non-goals (by design, for this v1)

- No persistence of past entries or BMI history
- No user accounts
- No iPad support — iPhone only
- No in-app purchases or paid tier — free
