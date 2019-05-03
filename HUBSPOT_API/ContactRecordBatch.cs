using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//
// HINT.....
// Edit -> Paste Special -> Paste JSON As Classes
//

namespace HUBSPOT_API
{
    public class ContactRecordBatch
    {
        public ContactRecord[] contacts { get; set; }
        public bool hasmore { get; set; }
        public int vidoffset { get; set; }
    }

    public class ContactRecord
    {
        public long addedAt { get; set; }
        public int vid { get; set; }
        public int canonicalvid { get; set; }
        public object[] mergedvids { get; set; }
        public int portalid { get; set; }
        public bool iscontact { get; set; }
        public string profiletoken { get; set; }
        public string profileurl { get; set; }
        public ContactProperties properties { get; set; }
        public object[] formsubmissions { get; set; }
        public ContactIdentityProfiles[] identityprofiles { get; set; }
        public object[] mergeaudits { get; set; }
    }

    public class ContactProperties
    {
        public Firstname firstname { get; set; }
        public Lastmodifieddate lastmodifieddate { get; set; }
        public Company company { get; set; }
        public Lastname lastname { get; set; }
        public LifeCycleStage lifecyclestage { get; set; }
    }

    public class Firstname
    {
        public string value { get; set; }
    }

    public class Lastmodifieddate
    {
        public string value { get; set; }
    }

    public class Company
    {
        public string value { get; set; }
    }

    public class Lastname
    {
        public string value { get; set; }
    }

    public class LifeCycleStage
    {
        public string value { get; set; }
    }

    public class ContactIdentityProfiles
    {
        public int vid { get; set; }
        public long savedattimestamp { get; set; }
        public int deletedchangedtimestamp { get; set; }
        public ContactIdentity[] identities { get; set; }
    }

    public class ContactIdentity
    {
        public string type { get; set; }
        public string value { get; set; }
        public long timestamp { get; set; }
    }
}




