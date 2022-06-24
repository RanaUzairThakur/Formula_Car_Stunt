using UnityEngine;
using UnityEngine.UI;

public class DeviceHardwareListner : MonoBehaviour
{
    public Text messageTxt;
    public Text HeaderTxt;
   
    public void UpdateTxt(string _str,string str) {
        this.gameObject.SetActive(true);
        messageTxt.text = _str;
        HeaderTxt.text = str;
    }

    public void OnPress_Okay() 
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.buttonPress);
        this.gameObject.SetActive(false);
        if (!Toolbox.DB.Prefs.UserConsent)
            Toolbox.GameManager.Load_MenuScene(false, 10);
        else
            Toolbox.GameManager.Load_MenuScene(false, 0);
        Toolbox.DB.Prefs.UserConsent = true;
    }

   

}
