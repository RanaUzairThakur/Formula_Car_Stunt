//using Cinemachine;
using System.Collections;
using UnityEngine;

/// <summary>
/// This script will hold everything that is needed to be global only in Game scene
/// </summary>
public class GameplayController : MonoBehaviour
{

    public Material[] skyboxes;


    public Camera GunCamera;

    private bool levelComplete = false;
    private bool levelFail = false;
    private bool isRevived = false;
    private int lives = 3;
    private Transform[] enemyspwanpoint;
    private Transform[] targetpoint;


    public bool LevelComplete { get => levelComplete; set => levelComplete = value; }
    public bool LevelFail { get => levelFail; set => levelFail = value; }
    public bool IsRevived { get => isRevived; set => isRevived = value; }
    //public GameObject TutorialCamera { get => tutorialCamera; set => tutorialCamera = value; }
    public Transform[] Enemyspwanpoint { get => enemyspwanpoint; set => enemyspwanpoint = value; }
    public Transform[] Targetpoint { get => targetpoint; set => targetpoint = value; }

    void Awake()
    {

        Toolbox.Set_GameplayScript(this);
        Time.timeScale = 1;
    }

    void Start()
    {
        Toolbox.Soundmanager.PlayMusic_Game(Random.Range(0, Toolbox.Soundmanager.gameBG.Length));
        Toolbox.GameManager.FBAnalytic_EventLevel_Started(Toolbox.GameManager.Get_CurGameModeName(), Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
        Toolbox.GameManager.Analytics_ProgressionEvent_Start(Toolbox.GameManager.Get_CurGameModeName(), Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
    }

    public void HUD_Status(bool _val)
    {
        Toolbox.HUDListner.Set_Mapstatus(_val);
        Toolbox.HUDListner.handleplayerhud(_val);
        Toolbox.HUDListner.Set_PlayerControls(_val);
        Toolbox.HUDListner.pauseBtn.gameObject.SetActive(_val);
        Toolbox.HUDListner.gameObject.SetActive(_val);
        Toolbox.HUDListner.PlayerGadgets.GetComponent<Canvas>().enabled = _val;
    }

    public IEnumerator SpecialMission_LevelComplete_Delay(float delay)
    {
        yield return new WaitForSeconds(1f);
        Toolbox.HUDListner.Missioncompletetext.SetActive(true);
        yield return new WaitForSeconds(delay + 1f);
        SpecialMission_LevelCompleteHandling();
        StopCoroutine(SpecialMission_LevelComplete_Delay(0.1f));
        // Invoke("LevelCompleteHandling",delay+1);
    }
    public void SpecialMission_LevelCompleteHandling()
    {
        HUD_Status(false);
        Toolbox.HUDListner.SpecialMission_CompletePanel.SetActive(true);
    }

    public IEnumerator LevelComplete_Delay(float delay)
    {
        yield return new WaitForSeconds(1f);
        Toolbox.HUDListner.Missioncompletetext.SetActive(true);
        yield return new WaitForSeconds(delay + 1f);
        LevelCompleteHandling();
        StopCoroutine(LevelComplete_Delay(0.1f));
        // Invoke("LevelCompleteHandling",delay+1);
    }
    public void LevelCompleteHandling()
    {

        if (LevelComplete || LevelFail)
            return;

        LevelComplete = true;

        HUD_Status(false);
        if ((!Toolbox.DB.Prefs.AppRated && Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode() == 2) || (!Toolbox.DB.Prefs.AppRated && Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode() == 5))
        {
            Toolbox.HUDListner.RateUs_Panel.SetActive(true);
            // Toolbox.GameManager.InstantiateUI_RateUs();
        }

        else
        {
            Toolbox.HUDListner.CompletePanel.SetActive(true);
            // Toolbox.GameManager.InstantiateUI_LevelComplete();
        }
    }
    public void LevelFail_Delay(float delay)
    {
        if (Toolbox.HUDListner.MissionFailtext)
            Toolbox.HUDListner.MissionFailtext.SetActive(true);
        Invoke("LevelFailHandling", delay);
    }
    public void LevelFailHandling()
    {

        if (LevelComplete || LevelFail)
            return;

        LevelFail = true;
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.levelFail);
        HUD_Status(false);
        Toolbox.HUDListner.FailPanel.SetActive(true);
    }

    public void CR_Revive()
    {
        HUD_Status(false);
        Toolbox.HUDListner.RevivePanel.SetActive(true);
        Toolbox.GameManager.Reviveplayer = true;

    }

    IEnumerator CR_ReviveAfterDelay()
    {

        yield return new WaitForSeconds(1);
        HUD_Status(false);
        Toolbox.HUDListner.RevivePanel.SetActive(true);

    }

    public void RevivePlayer()
    {

        if (LevelComplete || LevelFail)
            return;
        Time.timeScale = 1;
        LevelFail = false;
        IsRevived = true;
        HUD_Status(true);
        Toolbox.GameManager.FBAnalytic_EventDesign(Toolbox.GameManager.Get_CurGameModeName() + "_" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());

    }

}
