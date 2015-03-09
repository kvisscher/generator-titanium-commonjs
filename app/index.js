var yeoman = require("yeoman-generator"),
    uuid = require("uuid");

module.exports = yeoman.generators.Base.extend({
  constructor: function() {
    yeoman.generators.Base.apply(this, arguments);
    
    this.on("end", function() {
      this.installDependencies();
    });
  },
  
  promptUser: function() {
    var done = this.async();
    
    // Greet the user :)
    console.log(this.yeoman);
    
    var prompts = [
      {
        name: "moduleName",
        message: "What is the name of your module?",
        default: "Dinosaur module"
      },
      {
        name: "moduleDescription",
        message: "How would you describe the module?",
        default: "AWESOME!"
      }
    ];
    
    this.prompt(prompts, function(props) {
      this.pkgName = props.moduleName;
      this.pkgDescription = props.moduleDescription;
      this.titaniumGuid = uuid.v4();
      
      done();
    }.bind(this));
  },
  
  scaffoldFolders: function() {
    this.mkdir("src");
    this.mkdir("test");
  },
  
  copyMainFiles: function() {
    this.copy("_Gruntfile.coffee", "Gruntfile.coffee");
    
    this.template("_package.json", "package.json");
  }
});