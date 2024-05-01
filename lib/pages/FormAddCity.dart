Form(
    key: GlobalKey<FormState>,
    child: Column(
        children: [
            TextFormField(),
            TextFormField(),
            DropdownButtonFormField(),
            FormField(child: Checkbox()),
// ...
Button(
child: Text("Submit"),
onPressed: FormState.save()