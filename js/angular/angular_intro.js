// Main Characteristics:


// How does angular know when something has been changed?
// Inside angular, $scope.$apply() is wrapped automatically and updates
// the bindings, but outside of that function, e.g. in a setTimeout function,
// we need to explicitly make a call to update the bindings.
