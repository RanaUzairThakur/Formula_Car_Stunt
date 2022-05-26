using UnityEngine;
using UnityEngine.UI;
using Coffee.UIEffects;

public class LevelButtonListner : MonoBehaviour
{

    public Text levelNoTxt;
    public Text levelStatusTxt;
    //public Text levelNewStatusTxt;
    public GameObject buttonObj;
    //public GameObject watchVideoUnlockBtn;
    public GameObject lockObj;
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

    public void Lock_Status(bool _val) {

        lockObj.SetActive(_val);
    }

    //public void check_LevelState(bool _Val)
    //{
    //    PlayedState.SetActive(_Val);
    //}
    public void Set_LevleNameTxt(string _val)
    {
        levelNoTxt.text = _val;
        //levelNewnoTxt.text = _val;
    }
    public void Set_LevelstatusTxt(string _val)
    {
        levelStatusTxt.text = _val;
       
    }

    public void check_OutlineStatus(bool _val)
    {
        buttonObj.GetComponent<UIShiny>().enabled = _val;
    }

    //public void Set_NewLevelstatus(bool _Val)
    //{
    //    NewLevel.SetActive(_Val);
    //}

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
