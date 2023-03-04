{
  description = "Rails 7 flake template with dev tools included";

  outputs = { self, ... }: {
    templates = {
      rails-7 = {
        path = ./rails-7;
        # welcomeText = ''
        # '';
      };
    };

    templates.default = self.templates.rails-7;
  };
}
