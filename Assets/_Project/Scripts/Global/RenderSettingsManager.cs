using UnityEngine;
using UnityEngine.Profiling;

public enum FPSFixingState
{
    None,
    MildFPSFixing,
    RigorousFPSFixing,
    ExtremeFPSFixing
}

public enum TextureSizes
{
    High = 0,
    Half = 1,
    Quater = 2,
    Eighth = 3
}

public delegate void LowFPS();

public class RenderSettingsManager : MonoBehaviour
{
    public GameObject MessagePopup;
    public string deviceModel;
    //public static RenderSettingsManager instance;
    //public GameObject performancePopup;
    //[HideInInspector]
    //public bool IsDetectVeryCheapDevice;
    //[HideInInspector]
    //public bool IsDetectLowCheapDevice;
    //[HideInInspector]
    //public bool IsDetectMediumCheapDevice;

    public float VeryCheapDevice;
    public float LowCheapDevice;
    public float MediumCheapDevice;

    private int FramesPerSec;

    public float Deviceram;
    //public float minimumDeviceScore;
    //public float HighDeviceScore = 4;


    public LowFPS onLowFPS;


    public void Awake()
    {
        //instance = this;
       
    }

    void Start()
    {
        DontDestroyOnLoad(this);
        Toolbox.set_Rendersettingsmanager(this);
        //#if UNITY_ANDROID
        //        Application.targetFrameRate = 60;
        //#endif

        //#if UNITY_IOS
        //        Application.targetFrameRate = 30;
        //#endif
        this.CalculateSystemScore();
    }

    [ContextMenu("ChangesForLowFPS")]
    public void ChangesForLowFPS()
    {
        this.LowerTextureLimit();
    }

    public void LowerTextureLimit(TextureSizes textureSizes)
    {
        if (QualitySettings.masterTextureLimit < (int)TextureSizes.Eighth)
        {
            QualitySettings.masterTextureLimit = (int)textureSizes;
        }
     
        this.DisableAnisotropicTextureAndVSync();
    }

    

    private void ShowMessage()
    {
        MessagePopup.SetActive(true);
        Toolbox.GameManager.MessagePopup.GetComponent<DeviceHardwareListner>().UpdateTxt("Your device specification is not enough to Play the all feature of our Game.You need to Upgrade your Device if you wan to really Enjoy with Game of whole Feature.", "DEVICE SPECIFICATION");
    }

    #region LegacyStuff
    // int memoryReportCount = 0;

    //public void ReportForLowMemory()
    //{
    //    if (ActivityIndicator.instance)
    //    {
    //    }
    //    memoryReportCount++;

    //    if (memoryReportCount >= 2)
    //    {
    //        //        Application.lowMemory -= this.ReportForLowMemory;
    //    }
    //}
    //public void SwitchingTurnOffCamera()
    //{
    //    //if (GameManager.Instance)
    //    //{
    //    //    if (GameManager.Instance.mhud.isSecondaryCameraEnabled)
    //    //    {
    //    //        GameManager.Instance.mhud.ToggleSecondaryCameraFromHud(false);
    //    //        GameManager.Instance.mhud.ToggleSecondaryPerformance(true);
    //    //        GameManager.Instance.Toggle_SecondaryCamera(false);
    //    //        GameManager.Instance.mhud.isSecondaryCamActive = false;
    //    //    }
    //    //}
    //}

    //public void ChangeCamera(float value)
    //{
    //    //if(GameManager.Instance)
    //    //GameManager.Instance.playerCam.GetComponent<Camera>().farClipPlane = value;
    //}

    //[ContextMenu("ChangesForLowFPS")]
    //public void ChangesForLowFPS()
    //{

    //    //this.SwitchingTurnOffCamera();
    //    this.lowFPSTimer = 0;

    //    if (this.FPSState.Equals(FPSFixingState.ExtremeFPSFixing))
    //        return;

    //    switch (this.FPSState)
    //    {
    //        case FPSFixingState.None:
    //            //   this.ChangeCamera(30f);
    //            this.FPSState = FPSFixingState.MildFPSFixing;

    //            break;

    //        case FPSFixingState.MildFPSFixing:

    //            //if (this.renderSettingsCanvas)
    //            //    this.renderSettingsCanvas.gameObject.SetActive(true);

    //            this.FPSState = FPSFixingState.RigorousFPSFixing;
    //            //this.ChangeCamera(25f);
    //            //this.OnLowMemory();
    //            //Invoke("LowerTextureLimit", 0.5f);
    //            ActivityIndicator.instance.PrintStackTrace("Rigorous FPS Fixing");
    //            //       this.LowerTextureLimit();

    //            break;

    //        case FPSFixingState.RigorousFPSFixing:

    //            //if (this.renderSettingsCanvas)
    //            //    this.renderSettingsCanvas.gameObject.SetActive(true);

    //            this.FPSState = FPSFixingState.ExtremeFPSFixing;
    //            //this.ChangeCamera(20f);
    //            //Invoke("LowerTextureLimit", 0.5f);
    //            ActivityIndicator.instance.PrintStackTrace("Extreme FPS Fixing");
    //            //  this.LowerTextureLimit();
    //            break;
    //    }
    //    Constant.LogDesignEvent("OptimizationLevel:" + this.FPSState);
    //}
    //public void ResizeTexture(Texture2D texture)
    //{
    //    //int width = texture.width;
    //    //int height = texture.height;

    //    //if (texture.isReadable)
    //    //{
    //    //    texture.Resize(width / 2, height / 2);
    //    //    texture.Apply();

    //    //}
    //}

    //public void OnLowMemory()
    //{
    //    this.LowerTextureLimit();
    //    this.SwitchingTurnOffCamera();
    //    Constant.LogDesignEvent("RenderSettings:LowMemory:OptimizingMemory");
    //    bool textureResolutionLowered = false;
    //    if (TextureCarrier.instance)
    //    {
    //        TextureCarrier.instance.AssignCommonSharedMaterials(ref textureResolutionLowered);
    //    }

    //    if (QualitySettings.anisotropicFiltering != AnisotropicFiltering.Disable)
    //        QualitySettings.anisotropicFiltering = AnisotropicFiltering.Disable;

    //    if (!textureResolutionLowered)
    //        Resources.UnloadUnusedAssets();
    //}
    #endregion


    public void DisableAnisotropicTextureAndVSync()
    {
        if (QualitySettings.anisotropicFiltering != AnisotropicFiltering.Disable)
        {
            QualitySettings.anisotropicFiltering = AnisotropicFiltering.Disable;
        }

        if (QualitySettings.vSyncCount > 0)
            QualitySettings.vSyncCount = 0;
        QualitySettings.asyncUploadTimeSlice = 1;
        QualitySettings.asyncUploadBufferSize = 2;
    }

    public void LowerTextureLimit()
    {
        if (QualitySettings.masterTextureLimit < (int)TextureSizes.Eighth)
        {
            QualitySettings.masterTextureLimit = QualitySettings.masterTextureLimit + 1;
        }
        this.DisableAnisotropicTextureAndVSync();
    }
    //public bool isLowEndDevice = false;
    //public bool isHighEndDevice = false;

    bool OptimizationMessageGiven = false;
    [ContextMenu("Optimize")]
    public void OptimizeGameplay_VerycheapDevice()
    {
        this.LowerTextureLimit(TextureSizes.Eighth);
        if (!OptimizationMessageGiven)
        {
            OptimizationMessageGiven = true;
            //if (FindObjectOfType<AdsManager>())
            //    FindObjectOfType<AdsManager>().IsLowendDevice = isLowEndDevice;
            //if (FindObjectOfType<InAppHandler>())
            //    FindObjectOfType<InAppHandler>().Islowenddevice = isLowEndDevice;
            Toolbox.GameManager.Log("Splash::IsDetectVeryCheapDevice");
            ShowMessage();
        }
    }
    public void OptimizeGameplay_LowcheapDevice()
    {
     //   this.LowerTextureLimit(TextureSizes.Eighth);
        if (!OptimizationMessageGiven)
        {
            OptimizationMessageGiven = true;
            //if (FindObjectOfType<AdsManager>())
            //    FindObjectOfType<AdsManager>().IsLowendDevice = isLowEndDevice;
            //if (FindObjectOfType<InAppHandler>())
            //    FindObjectOfType<InAppHandler>().Islowenddevice = isLowEndDevice;
            Toolbox.GameManager.Log("Splash:IsDetectLowCheapDevice");
            ShowMessage();
        }
    }
    private void OptimizeGameplay_MediumcheapDevice()
    {
        if (FindObjectOfType<AdsManager>())
            FindObjectOfType<AdsManager>().Initialization();
        if (FindObjectOfType<InAppHandler>())
            FindObjectOfType<InAppHandler>().InitializePurchasing();
        if (!Toolbox.DB.Prefs.UserConsent)
            Toolbox.GameManager.Load_MenuScene(false, 10);
        else
            Toolbox.GameManager.Load_MenuScene(false, 0);
        Toolbox.DB.Prefs.UserConsent = true;
        Toolbox.GameManager.Log("Splash:HighSpecsDevice:DeviceMemory:" + this.Deviceram);
    }

    public void CalculateSystemScore()
    {
        Toolbox.DB.Prefs.DeviceSpecificationCheck = true;
        this.deviceModel = SystemInfo.deviceModel;
        this.Deviceram = SystemInfo.systemMemorySize /*/ 1024*/;

        //Just fo Editor testing 
        //this.Deviceram = 800f;
        
        Toolbox.GameManager.Log(" Device memory: " + SystemInfo.systemMemorySize);
        if (Deviceram <= VeryCheapDevice)
        {
            this.OptimizeGameplay_VerycheapDevice();
             Toolbox.DB.Prefs.IsDetectVeryCheapDevice = true;
            Toolbox.DB.Prefs.IsDetectLowCheapDevice = false;
            Toolbox.DB.Prefs.IsDetectMediumCheapDevice = false;
        }
        else if (Deviceram <= LowCheapDevice)
        {
            this.OptimizeGameplay_LowcheapDevice();
            Toolbox.DB.Prefs.IsDetectVeryCheapDevice = false;
            Toolbox.DB.Prefs.IsDetectLowCheapDevice = true;
            Toolbox.DB.Prefs.IsDetectMediumCheapDevice = false;
        }
        else if (Deviceram <= MediumCheapDevice)
        {
            Toolbox.DB.Prefs.IsDetectVeryCheapDevice = false;
            Toolbox.DB.Prefs.IsDetectLowCheapDevice = false;
            Toolbox.DB.Prefs.IsDetectMediumCheapDevice = true;
            Toolbox.GameManager.Log("Device is Good Enough");
            OptimizeGameplay_MediumcheapDevice();
        }
        else
        {
            Toolbox.DB.Prefs.IsDetectVeryCheapDevice = false;
            Toolbox.DB.Prefs.IsDetectLowCheapDevice = false;
            Toolbox.DB.Prefs.IsDetectMediumCheapDevice = false;
            Toolbox.GameManager.Log("Device is very Good Enough");
            OptimizeGameplay_MediumcheapDevice();
        }
        //float memoryScore = totalRam / this.minimumMemory;

        //Debug.Log("Total MemoryScore: " + memoryScore);

        //this.machineScore = memoryScore;

        //if (this.machineScore <= this.minimumDeviceScore)
        //{
        //    this.OptimizeGameplay();
        //}
        //else if (this.machineScore >= this.HighDeviceScore)
        //{
        //    this.SetGameQualityGraphics();
        //}
    }
   
}
