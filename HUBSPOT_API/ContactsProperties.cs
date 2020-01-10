using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HUBSPOT_API
{
    class ContactsProperties
    {
        public string name { get; set; }
        public string label { get; set; }
        public string description { get; set; }
        public string groupName { get; set; }
        public string type { get; set; }
        public string fieldType { get; set; }
        public List<Option> options { get; set; }
        public int displayOrder { get; set; }
        public bool hidden { get; set; }
        public bool formField { get; set; }
        public bool readOnlyValue { get; set; }
        public bool readOnlyDefinition { get; set; }
        public bool mutableDefinitionNotDeletable { get; set; }
        public bool favorited { get; set; }
        public int favoritedOrder { get; set; }
        public bool calculated { get; set; }
        public bool externalOptions { get; set; }
        public string displayMode { get; set; }
        public bool hubspotDefined { get; set; }
        public bool? optionsAreMutable { get; set; }
        public bool? showCurrencySymbol { get; set; }
        public string numberDisplayHint { get; set; }
        public bool? deleted { get; set; }
        public int? createdUserId { get; set; }
        public int? updatedUserId { get; set; }
        public string textDisplayHint { get; set; }
    }

    public class Option
    {
        public string label { get; set; }
        public string value { get; set; }
    }
    
    public class AddContactPropertyMultiSelect
    {
        public string name { get; set; }
        public string label { get; set; }
        public string description { get; set; }
        public string groupName { get; set; }
        public string type { get; set; }
        public string fieldType { get; set; }
        public bool hidden { get; set; }
        public List<Option> options { get; set; }
        public bool formField { get; set; }
    }
    
    public class AddContactPropertyString
    {
        public string name { get; set; }
        public string label { get; set; }
        public string description { get; set; }
        public string groupName { get; set; }
        public string type { get; set; }
        public string fieldType { get; set; }
        public bool formField { get; set; }
        public int displayOrder { get; set; }
        public List<Option> options { get; set; }
    }
}
