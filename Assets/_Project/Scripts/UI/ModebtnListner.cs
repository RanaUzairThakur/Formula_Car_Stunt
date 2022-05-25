using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ModebtnListner : MonoBehaviour
{
    public GameObject lockObj;
    public Text Nametxt;
   
    public void Lock_Status(bool _val)
    {

        lockObj.SetActive(_val);
    }
    public void Set_Nameofmode(string name)
    {
        Nametxt.text = name.ToString();
    }
    #region ButtonListners

    public void OnPress_chapterButton(GameObject _buttonTransform)
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.levelpress);
        this.GetComponentInParent<ChapterSelection>().OnPress_chapterButton(_buttonTransform);
    }

    public void OnPress_ChapterLockButton()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.OnPresslockedbutton);
        Toolbox.UIManager.ModeLockPopup.SetActive(true);
        Toolbox.UIManager.ModeLockPopup.GetComponent<MessageListner>().UpdateTxt("This chapter is currently locked. Play atleast " + (Constants.mode2UnlockAfterLevels + 1) + " levels of current chapter to unlock the glory of this chapter", "LOCKED");
    }

    public void OnPress_ChapterLock_ComingSoon()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.OnPresslockedbutton);
        Toolbox.UIManager.ModeLockPopup.SetActive(true);
        Toolbox.UIManager.ModeLockPopup.GetComponent<MessageListner>().UpdateTxt("This chapter is currently locked. Coming Soon" , "LOCKED");
    }
    #endregion

}
