using UnityEngine;
using System.Collections.Generic;
public class EffectListener : MonoBehaviour
{
    public GameObject Booseffect;
    public GameObject nos_AirEffect;
    public GameObject TyreTrail;
    public GameObject NeonTyreleft;
    public GameObject NeonTyreRight;
    //private bool ischeapdevice = false;
    //private void Awake()
    //{
    //    if (Toolbox.DB.Prefs.IsDetectVeryCheapDevice)
    //    {
    //        ischeapdevice = true;
    //    }
    //    else if (Toolbox.DB.Prefs.IsDetectLowCheapDevice)
    //    {
    //        ischeapdevice = false;
    //    }
    //    else if (Toolbox.DB.Prefs.IsDetectMediumCheapDevice)
    //    {
    //        ischeapdevice = false;
    //    }
    //    else
    //    {
    //        ischeapdevice = false;
    //    }
    //}

    public void set_statusAirEffect(bool val, bool isgrounded)
    {
        //if (ischeapdevice)
        //    return;

        nos_AirEffect.SetActive(val);
        Booseffect.SetActive(val);
        if (val)
        {
            if (isgrounded)
            {
                TyreTrail.SetActive(val);
                NeonTyreleft.SetActive(val);
                NeonTyreRight.SetActive(val);
            }
            // print("Boost");
        }
        else
        {
            TyreTrail.SetActive(val);
            NeonTyreleft.SetActive(val);
            NeonTyreRight.SetActive(val);

        }
    }
}
