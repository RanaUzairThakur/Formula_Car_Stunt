using UnityEngine;

[RequireComponent(typeof(GameManager))]
[RequireComponent(typeof(SoundsManager))]
[RequireComponent(typeof(DB))]
//[RequireComponent(typeof(AdsManager))]

public class Toolbox : MonoBehaviour {
    private static GameManager gameManager;
    private static SoundsManager soundManager;
    private static DB db;
   // private static AdsManager adsManager;
    private static ObjectiveHandler objectivehandler;
    private static UIManager uimanager;
    private static RandomPlayerPositionScript playerpos;
    //private static InAppHandler inAppHandler;
    private static AdIconHandler adIconHandler;
    private static GameplayController gameplayController;
    private static HUDListner hudListner ;
    private static MovePointAssigner_Helli movepointhelli;
    public static GameManager GameManager {
        get { return gameManager; }
    }

    public static SoundsManager Soundmanager {
        get { return soundManager; }
    }
    
    public static DB DB
    {
        get { return db; }
    }

    
    public static ObjectiveHandler ObjectiveHandler
    {
        get { return objectivehandler; }
    }
    public static UIManager UIManager
    {
        get { return uimanager; }
    }
    public static RandomPlayerPositionScript RandomPlayerPositionScript
    {
        get { return playerpos; }
    }
 
    public static AdIconHandler AdIconHandler
    {
        get { return adIconHandler; }
    }
    public static GameplayController GameplayController
    {
        get { return gameplayController; }
    }

    public static HUDListner HUDListner
    {
        get { return hudListner; }
    }
   
   
    public static MovePointAssigner_Helli MovePointAssigner_Helli
    {
        get { return movepointhelli; }
    }
   
    void Awake()
    {
        gameManager = GetComponent<GameManager>();
        soundManager = GetComponent<SoundsManager>();
        db = GetComponent<DB>();
        adIconHandler = GetComponent<AdIconHandler>();
        DontDestroyOnLoad(gameObject);
    }

    public static void Set_GameplayScript (GameplayController _game) {
        gameplayController = _game;
    }

    public static void Set_HUD(HUDListner _hud)
    {
        hudListner = _hud;
    }
    public static void Set_objectivehandler(ObjectiveHandler obj)
    {
        objectivehandler = obj;
    }
    public static void Set_Uimanager(UIManager obj)
    {
        uimanager  = obj;
    }
    public static void Set_RandomPlayerpos(RandomPlayerPositionScript obj)
    {
        playerpos = obj;
    }
    
    public static void Set_MovepointHelli(MovePointAssigner_Helli obj)
    {
        movepointhelli = obj;
    }
}