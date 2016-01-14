class Views::Users::New < Views::Layouts::Page
  def main
    widget Views::Login::Form, create: true
  end
end
