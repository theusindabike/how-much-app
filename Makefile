run:
	flutter run --flavor production --target lib/main_production.dart


build:
	very_good packages get -r

tests:
	flutter test --coverage --test-randomize-ordering-seed random