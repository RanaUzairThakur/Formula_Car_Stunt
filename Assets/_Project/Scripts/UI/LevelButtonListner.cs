using UnityEngine;
using UnityEngine.UI;


public class LevelButtonListner : MonoBehaviour
{

    public Text levelNoTxt;
    public Text levelStatusTxt;
    public GameObject Levelselected;
    public GameObject buttonObj;
    //public GameObject watchVideoUnlockBtn;
    public GameObject lockObj;
    public Text LevelName;
    public GameObject IndicatorArrow;
    //public GameObject PlayedState;
    //public GameObject NewLevel;
    //public GameObject[] stars;

    //public void Stars_Status(bool _val, int _enabledStars)
    //{
    //    starsParent.SetActive(_val);

    //    if (_val) {

    //        for (int i = 0; i < _enabledStars; i++)
    //        {
    //            stars[i].SetActive(true);
    //        }
    //    }
    //}

    public void Lock_Status(bool _val)
    {

        lockObj.SetActive(_val);
    }

    public void set_LevelName(string _Val, Color clr)
    {
        LevelName.text = _Val.ToString();
        LevelName.color = clr;
    }
    public void Set_LevleNameTxt(string _val, Color clr)
    {
        levelNoTxt.text = _val;
        levelNoTxt.color = clr;
    }
    public void Set_LevelstatusTxt(string _val, Color clr)
    {
        levelStatusTxt.text = _val;
        levelStatusTxt.color = clr;
    }

    public void check_OutlineStatus(bool _val)
    {
       // buttonObj.GetComponent<>().enabled = _val;
        Levelselected.SetActive(_val);
    }

    public void Set_NewArrow(bool _Val)
    {
        if (Toolbox.DB.Prefs.Tutorialshowfirsttime)
            IndicatorArrow.SetActive(_Val);
        else
            IndicatorArrow.SetActive(false);
    }

    //public void WatchVideoUnlock_Status(bool _val) {

    //    watchVideoUnlockBtn.SetActive(_val);
    //}

    #region ButtonListners

    public void OnPress_LevelButton(GameObject _buttonTransform)
    {
        //  Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.buttonPress);
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.levelpress);
        this.GetComponentInParent<LevelSelectionListner>().OnPress_LevelButton(_buttonTransform);

    }

    public void OnPress_LevelLockButton(GameObject _buttonTransform)
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.OnPresslockedbutton);
        Toolbox.UIManager.ModeLockPopup.SetActive(true);
        Toolbox.UIManager.ModeLockPopup.GetComponent<MessageListner>().UpdateTxt("This Level is currently locked.Please Play before Previous Level", "LEVEL LOCKED");
        //  Toolbox.GameManager.Instantiate_ModeLockedMessage("Level is locked.", "LOCKED");
    }

    #endregion

}
