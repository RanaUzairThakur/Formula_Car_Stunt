using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DailyRewardListner : MonoBehaviour
{
    private bool isNextDayVideoReward = false;

    public Text coinsTxt;
    public GameObject nextDayRewardVideoBtn;

    public Transform buttonsParent;
    public Image dynamicRewardImg1;
    public GameObject dynamicRewardObj1;
    public GameObject inPlaceOfDynamicRewardObj1;

    public Image dynamicRewardImg2;
    public GameObject dynamicRewardObj2;
    public GameObject inPlaceOfDynamicRewardObj2;

    public Image dynamicRewardImg3;
    public GameObject dynamicRewardObj3;
    public GameObject inPlaceOfDynamicRewardObj3;

    public GameObject claimBtn;
    public GameObject closeBtn;

    private int tileWidth = 347;
    private int tileSpacing = 20;

    [Tooltip("Will be false if all the items . purchased")]
    public bool hasDynamicReward = false;

    [SerializeField] private int dynamicRewardDay1;
    [SerializeField] private int dynamicRewardDay2; 
    [SerializeField] private int dynamicRewardDay3; //it should be the last day
    [SerializeField] private int dynamicReward;

    public Sprite[] dynamicRewardImages; // List of all the rewards to be given from the shop ---- first locked item will be shown

    private List<DailyRewardBtnListner> rewardButtons;

    public int DynamicRewardDay1 { get => dynamicRewardDay1; set => dynamicRewardDay1 = value; }
    public int DynamicRewardDay2 { get => dynamicRewardDay2; set => dynamicRewardDay2 = value; }
    public int DynamicRewardDay3 { get => dynamicRewardDay3; set => dynamicRewardDay3 = value; }
    public int DynamicReward { get => dynamicReward; set => dynamicReward = value; }

    private void OnEnable()
    {
        //Toolbox.GameManager.Add_ActiveUI(this.gameObject);
        UpdateTxts();
        //if (FindObjectOfType<AbstractAdsmanager>())
        //    FindObjectOfType<AbstractAdsmanager>().HideBannners();
    }

    private void OnDisable()
    {
       // Toolbox.GameManager.Remove_ActiveUI(this.gameObject);

        if (FindObjectOfType<DailyRewardHandler>())
            FindObjectOfType<DailyRewardHandler>().DailyRewardTxtHandling();
        //if (FindObjectOfType<AbstractAdsmanager>())
        //    FindObjectOfType<AbstractAdsmanager>().ShowSmallBanner(GoogleMobileAds.Api.AdPosition.Top);

    }


    private void Start()
    {
        rewardButtons = new List<DailyRewardBtnListner>();

        //if (Toolbox.DB.Prefs.DailyRewardDay > 4) {

        //    buttonsParent.localPosition = new Vector3(
        //        -(Toolbox.DB.Prefs.DailyRewardDay * tileWidth)
        //        - (Toolbox.DB.Prefs.DailyRewardDay * tileSpacing), 0, 0);
        //}
        

        //print("NextDailyRewardTime :" + Toolbox.DB.Prefs.NextDailyRewardTime);
        if (DateTime.Now >= Toolbox.DB.Prefs.NextDailyRewardTime)
        {
            claimBtn.SetActive(true);
            closeBtn.SetActive(false);

            NoRewardShowHandling();
            //print("DateTime Greater");
            //RewardPlayerHandling();
        }
        else
        {
            claimBtn.SetActive(false);
            closeBtn.SetActive(true);
            HandleRewardedVideoBtn();
            //print("DateTime Less");
            NoRewardShowHandling();
        }
    }
    public void RewardPlayerHandling()
    {
        //Debug.LogError("Reward");

        HandleRewardedVideoBtn();

        UpdateNextDayRewardTime();

        HandleDynamicRewardItems();

        RewardPlayer(Toolbox.DB.Prefs.DailyRewardDay);

        IncrementDailyRewardDay();

        UpdateButtons();

        UpdateTxts();
    }

    public void NoRewardShowHandling() {

        //Debug.LogError("NO Reward");
        //int day = Toolbox.DB.Prefs.DailyRewardDay;

        //if (Toolbox.DB.Prefs.DailyRewardDay > 0)
        //    Toolbox.DB.Prefs.DailyRewardDay--;

        HandleRewardedVideoBtn();
        HandleDynamicRewardItems();
        UpdateButtons();
        UpdateTxts();

        //Toolbox.DB.Prefs.DailyRewardDay = day;
    }

    private void HandleRewardedVideoBtn()
    {
        TimeSpan diff = Toolbox.DB.Prefs.NextDailyRewardTime - DateTime.Now;
        //print("diff :"+ diff + "IsRewardedAdReady :" + AdsManager.Instance.IsRewardedAdReady());
        if ((diff.Days <= 0 && Toolbox.DB.Prefs.DailyRewardDay < 6) /*&& AdsManager.Instance.IsRewardedAdReady()*/)
        {
            if(!claimBtn.activeSelf)
                nextDayRewardVideoBtn.SetActive(true);
        }
        else
        {
            nextDayRewardVideoBtn.SetActive(false);
        }
    }

    public void UpdateTxts()
    {
        coinsTxt.text = Toolbox.DB.Prefs.GoldCoins.ToString();
    }

    private void HandleDynamicRewardItems()
    {
        try
        {
            //int lockedItemIndex = Toolbox.DB.Prefs.GetLockedItemIndex(1);
            int lockedItemIndex = Constants.Firstdynamicreward;
             //print("lockedItemIndex :" + lockedItemIndex);
            // int secondLockedItemIndex = Toolbox.DB.Prefs.GetLockedItemIndex(6);
            int secondLockedItemIndex = Constants.Seconndynamicreward; ;
            //print("secondLockedItemIndex :"+ secondLockedItemIndex);

            //int thirdLockedItemIndex = Toolbox.DB.Prefs.GetLockedItemIndex(3);
            int thirdLockedItemIndex = Constants.Thirddynamicreward; ;
            //print("secondLockedItemIndex :" + thirdLockedItemIndex);

            if ( !Toolbox.DB.Prefs.AreAllGunsUnlocked()  || Toolbox.DB.Prefs.AreAllGunsUnlocked()/*&& lockedItemIndex >= 0*/)
            {
                hasDynamicReward = true;

                if (Toolbox.DB.Prefs.DailyRewardDay >= DynamicRewardDay1)
                {
                    dynamicRewardImg1.sprite = dynamicRewardImages[lockedItemIndex];
                    DynamicReward = Constants.Firstdynamicreward;
                    //secondLockedItemIndex = Toolbox.DB.Prefs.GetLockedItemIndex(1);
                  //print("DynamicRewardDay1");
                }
                else
                {
                    Toolbox.DB.Prefs.DynamicDailyRewardItemNumber1 = lockedItemIndex;
                    dynamicRewardImg1.sprite = dynamicRewardImages[lockedItemIndex];
                    //print("DynamicRewardDay1 :"+ lockedItemIndex);
                }

                dynamicRewardObj1.SetActive(true);
                inPlaceOfDynamicRewardObj1.SetActive(false);

                if (Toolbox.DB.Prefs.DailyRewardDay >= DynamicRewardDay2)
                {
                    dynamicRewardImg2.sprite = dynamicRewardImages[secondLockedItemIndex];
                    DynamicReward = Constants.Seconndynamicreward;
                    //secondLockedItemIndex = Toolbox.DB.Prefs.GetLockedItemIndex(2);
                   // print("DynamicRewardDay2");
                }
                else
                {
                    Toolbox.DB.Prefs.DynamicDailyRewardItemNumber1 = secondLockedItemIndex;
                    dynamicRewardImg2.sprite = dynamicRewardImages[secondLockedItemIndex];
                    //print("DynamicRewardDay2 :" + secondLockedItemIndex);
                }

                dynamicRewardObj2.SetActive(true);
                inPlaceOfDynamicRewardObj2.SetActive(false);

                //Handling of second dynamic item. To make this code work 2nd dynamic item should always be the last item - Otherwise add code handling like item 1

                if (Toolbox.DB.Prefs.DailyRewardDay >= DynamicRewardDay3)
                {
                    dynamicRewardImg3.sprite = dynamicRewardImages[thirdLockedItemIndex];
                    DynamicReward = Constants.Thirddynamicreward;
                    //secondLockedItemIndex = Toolbox.DB.Prefs.GetLockedItemIndex(2);
                    //print("DynamicRewardDay3");
                }
                else
                {
                    Toolbox.DB.Prefs.DynamicDailyRewardItemNumber1 = thirdLockedItemIndex;
                    dynamicRewardImg3.sprite = dynamicRewardImages[thirdLockedItemIndex];
                    //print("DynamicRewardDay3 :" + thirdLockedItemIndex);
                }
                dynamicRewardObj3.SetActive(true);
                inPlaceOfDynamicRewardObj3.SetActive(false);

                //if (thirdLockedItemIndex >= 0)
                //{
                //    if (Toolbox.DB.Prefs.DailyRewardDay < DynamicRewardDay3)
                //        dynamicRewardImg3.sprite = dynamicRewardImages[thirdLockedItemIndex];
                //    DynamicReward = Constants.Thirddynamicreward;
                //    print("DynamicRewardDay3 :" + thirdLockedItemIndex);
                //    dynamicRewardObj3.SetActive(true);
                //    inPlaceOfDynamicRewardObj3.SetActive(false);
                //}
                //else
                //{
                //    dynamicRewardObj3.SetActive(false);
                //    inPlaceOfDynamicRewardObj3.SetActive(true);
                //}
            }
            else
            { //No Item in shop is availble --- All items are bought

                //if (Toolbox.DB.Prefs.DailyRewardDay >= DynamicRewardDay1)
                //{
                //    dynamicRewardImg1.sprite = dynamicRewardImages[Toolbox.DB.Prefs.DynamicDailyRewardItemNumber1];
                //    secondLockedItemIndex = Toolbox.DB.Prefs.GetLockedItemIndex(1);
                //}
                //else
                //{
                //    dynamicRewardObj1.SetActive(false);
                //    inPlaceOfDynamicRewardObj1.SetActive(true);
                //}

                //dynamicRewardObj2.SetActive(false);
                //inPlaceOfDynamicRewardObj2.SetActive(true);

                hasDynamicReward = false;
            }

            //handle case if all is unlocked and day is greater than 1st dynamic reward day
            //if (Toolbox.DB.Prefs.DynamicDailyRewardItemNumber1 >= 0)
            //{

            //    dynamicRewardImg1.sprite = dynamicRewardImages[Toolbox.DB.Prefs.DynamicDailyRewardItemNumber1];

            //    dynamicRewardObj1.SetActive(true);
            //    inPlaceOfDynamicRewardObj1.SetActive(false);
            //}
        }
        catch (Exception ex)
        {

        }
        
    }

    void UpdateButtons()
    {
        try
        {
            for (int i = 0; i < buttonsParent.childCount; i++)
            {
                DailyRewardBtnListner btn = buttonsParent.GetChild(i).GetComponent<DailyRewardBtnListner>();

                if (i < Toolbox.DB.Prefs.DailyRewardDay)
                {
                    //Toolbox.GameManager.Log("LESS_Button = " + i + "DR = " + Toolbox.DB.prefs.DailyRewardDay);
                    btn.statusTxt.text = "Claimed";
                    btn.statusbar.SetActive(true);
                    btn.claimNowObj.SetActive(false);
                    btn.claimedImg.SetActive(true);
                    btn.coinsTxt.text = Constants.dailyReward[i].ToString() + "Coins";
                    btn.coinsTxtbar.SetActive(false);

                    Debug.LogError("Less");
                }
                else if (i == Toolbox.DB.Prefs.DailyRewardDay && claimBtn.activeSelf)
                {
                    //Toolbox.GameManager.Log("LESS_Button = " + i + "DR = " + Toolbox.DB.prefs.DailyRewardDay);
                    btn.statusTxt.text = "Claim";
                    btn.statusTxt.color = Color.green;
                    btn.claimNowObj.SetActive(true);
                    if(!btn.IsDynamicRewrad)
                       btn.coinsTxt.text = Constants.dailyReward[i].ToString() + "Coins";
                    btn.coinsTxtbar.SetActive(true);
                    Debug.LogError("Equal");
                }
                else
                {

                    btn.statusTxt.text = "Locked";
                    btn.statusbar.SetActive(false);
                    btn.claimNowObj.SetActive(false);
                    btn.statusTxt.color = Color.white;
                    if (!btn.IsDynamicRewrad)
                        btn.coinsTxt.text = Constants.dailyReward[i].ToString() + "Coins";
                    btn.coinsTxtbar.SetActive(true);
                    Debug.LogError("More");
                }

                rewardButtons.Add(btn);
            }
        }
        catch (Exception ex) { 
        
        }
        
    }

    void IncrementDailyRewardDay()
    {
        //If it is the last day of the week
        if (Toolbox.DB.Prefs.DailyRewardDay + 1 > Constants.dailyReward.Length - 1)
        {
            Toolbox.DB.Prefs.DailyRewardDay = 0;
            Toolbox.DB.Prefs.DynamicDailyRewardItemNumber1 = -1;
        }
        else
        {
            Toolbox.DB.Prefs.DailyRewardDay++;
           // Toolbox.DB.Prefs.ClassicMode_UnlockDateTime++;
            //print("DailyRewardDay :" + Toolbox.DB.Prefs.DailyRewardDay);
        }
    }

    void UpdateNextDayRewardTime() {

        if (isNextDayVideoReward)
        {
            DateTime tempTIme = Toolbox.DB.Prefs.NextDailyRewardTime;
            //tempTIme = tempTIme.AddDays(1);
            Toolbox.DB.Prefs.NextDailyRewardTime = tempTIme;
            isNextDayVideoReward = false;

            Toolbox.GameManager.Log("Next Day Reward Video. TIME = " + Toolbox.DB.Prefs.NextDailyRewardTime);
        }
        else
        {
            Toolbox.DB.Prefs.NextDailyRewardTime = DateTime.Now.AddDays(1);
        }

        //Toolbox.GameManager.ScheduleDailyRewardNotification();
    }

    public void RewardPlayer(int _day) {
        int reward = Constants.dailyReward[_day];

        //if (_day == DynamicRewardDays[dynamicRewardDayIndex] && hasDynamicReward)
        if (isDynamicRewardDay(_day) && hasDynamicReward)
        {
            // Toolbox.DB.Prefs.VehiclesUnlocked[Toolbox.DB.Prefs.GetLockedItemIndex(1)] = true;
            //print("Give Reward To User :"+ DynamicReward);
            Toolbox.DB.Prefs.VehiclesUnlocked[DynamicReward] = true;
            //StartCoroutine(CR_ShowMessageAfterDelay("You have been awarded a new vehicle. Come back tomorrow for next day reward.", "Congratulations", false));

        }
        else
        {
            Toolbox.DB.Prefs.GoldCoins += Constants.dailyReward[_day];
            //StartCoroutine(CR_ShowMessageAfterDelay("You have been awarded Day " + (_day + 1) + " reward " + (reward) + " Coins" + " . Come back tomorrow for next day reward.", "Congratulations", true));
            //Toolbox.GameManager.Instantiate_CoinEffect();

        }
    }

    IEnumerator CR_ShowMessageAfterDelay(string _str,string str,  bool showCoins) {

        yield return new WaitForSeconds(0.5f);

        //Toolbox.GameManager.Instantiate_Message(_str,str);

    }

    bool isDynamicRewardDay(int _day) {

        if (_day == DynamicRewardDay1 || _day == DynamicRewardDay2 ||  _day == DynamicRewardDay3)
                return true;

        return false;
    }

    public void OnPress_Close(){

        this.gameObject.SetActive(false);
    }

    public void OnPress_Shop() {

        //Toolbox.GameManager.InstantiateUI_Shop();
        OnPress_Close();
    }

    public void OnPress_WatchVideo() {

        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.buttonPress);

        //if (AdsManager.Instance.IsRewardedAdReady())
        //{
        //    isNextDayVideoReward = true;
        //    nextDayRewardVideoBtn.SetActive(false);

        //    if (FindObjectOfType<AbstractAdsmanager>())
        //        FindObjectOfType<AbstractAdsmanager>().ShowRewardedVideo(RewardType.CLAIM_NEXT_DAY_DAILYREWARD);
        // //  AdsManager.Instance.ShowRewardedVideo(AdsManager.RewardType.CLAIM_NEXT_DAY_DAILYREWARD);
        //}
        //else {

        //    Toolbox.GameManager.ShowMessage("Rewarded Ad not available. Please try again later.", "Message");
        //}
    }

    public void OnPress_Claim ()
    {
        //Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.dailyrewardVocalSoundEffect);
        //Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.CheckPoint);

        Toolbox.DB.Prefs.NextDailyRewardTime = DateTime.Now.AddDays(1);
        PlayerPrefs.SetString("NextDailyRewardTime", Toolbox.DB.Prefs.NextDailyRewardTime.ToBinary().ToString());
       // print("OnPress_Claim :" + PlayerPrefs.GetString("NextDailyRewardTime"));
        Toolbox.DB.Prefs.DailyRewardTime = Toolbox.DB.Prefs.NextDailyRewardTime.ToString();
        Toolbox.DB.Prefs.Dailyrewardclaimed = true;
        //Toolbox.GameManager.ScheduleDailyRewardNotification();

        claimBtn.SetActive(false);
        closeBtn.SetActive(true);
        HandleRewardedVideoBtn();
        RewardPlayerHandling();
       // Toolbox.UIManager.UpdateTxts();
        Toolbox.DB.Save_Json_Prefs();
    }
}
