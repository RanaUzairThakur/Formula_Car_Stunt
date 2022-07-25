using UnityEngine;

public class Cutscenemanager : MonoBehaviour
{
    public float Completetime;
    public GameObject Cutsceneobj;
    // Start is called before the first frame update
    void Awake()
    {
        Toolbox.Set_cutscenemanager(this);
        //Cutsceneobj.SetActive(false);
    }

    //private void OnEnable()
    //{
    //    if (Toolbox.GameplayController.SelectedLevelData.Hascutscene)
    //        Invoke(nameof(FinishCutscene), Completetime);
    //}

    public void FinishCutscene()
    {
       //FadeEffect();
        Invoke(nameof(FadeEffect),Completetime);
    }

    public void FadeEffect()
    {
        Toolbox.HUDListner.setstatus_FadeEffect(true);
        Invoke(nameof(StartGame), 2f);
        CancelInvoke(nameof(FadeEffect));
    }

    public void StartGame()
    {
       // Toolbox.HUDListner.SetStatus_SkipAnimationButton(false);
        Cutsceneobj.SetActive(false);
        Toolbox.HUDListner.setstatus_FadeEffect(false);
        Toolbox.GameManager.Log("StartGame");
        Toolbox.GameplayController.SpawnVehicle();
        CancelInvoke(nameof(StartGame));
    }
    public void SkipAnimation()
    {
        CancelInvoke(nameof(FinishCutscene));
        CancelInvoke(nameof(FadeEffect));
        CancelInvoke(nameof(StartGame));
        Cutsceneobj.SetActive(false);
        Toolbox.GameplayController.SpawnVehicle();
       // Toolbox.HUDListner.SetStatus_SkipAnimationButton(false);
    }
}
