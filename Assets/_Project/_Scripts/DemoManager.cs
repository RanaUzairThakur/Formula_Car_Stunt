//using PathSystem;
using System.Collections;
using UnityEngine;
public class DemoManager : MonoBehaviour
{
    public static DemoManager Instance;

    [Space(10)]
    [Header("DemoCars")]
    public GameObject[] Car_List;
    public GameObject[] Demos;
    //[Space(10)]
    //[Header("SpwanPositions")]
    //public GameObject[] Positions;
    //[Space(10)]
    //[Header("Paths")]
    //public PathSystem_Branch[] Paths;
    //public PathSystem_Branch[] Paths2;
    //public PathSystem_Branch[] personPaths;
 
    public GameObject SkipButton;
    private Vector3 ChangeScale;
    [HideInInspector]
    public GameObject Democars;


    public void Awake()
    {
        Instance = this;

    }
    public void Swpan()
    {


        if (Demos[PlayerPrefs.GetInt("level_number")])
        {
            Demos[PlayerPrefs.GetInt("level_number")].SetActive(true);
            Car_List[PlayerPrefs.GetInt("MNum")].SetActive(true);
            StartCoroutine(FirstDemoWait());
        }
        else 
        {
            Directcounting();
        }
    }
    //IEnumerator Level8()
    //{
    //    yield return new WaitForSeconds(3.5f);
    //    Democars = Instantiate(Car_List[PlayerPrefs.GetInt("MNum")], Positions[PlayerPrefs.GetInt("level_number")].transform.position, Positions[PlayerPrefs.GetInt("level_number")].transform.rotation);
    //    Democars.transform.localScale = new Vector3(2f, 2f, 2f);
    //    Democars.transform.Rotate(0, 90, 0);
    //    StopCoroutine(Level8());
    //}
    //IEnumerator Level10()
    //{
    //    //Debug.Log("Level 10 waly function mai agya hay");
    //    yield return new WaitForSeconds(4f);
    //    Democars = Instantiate(Car_List[PlayerPrefs.GetInt("MNum")], Positions[PlayerPrefs.GetInt("level_number")].transform.position, Positions[PlayerPrefs.GetInt("level_number")].transform.rotation);
    //    Democars.transform.localScale = new Vector3(2.5f, 2.5f, 2.5f);
    //    //Democars.gameObject.GetComponent<Rigidbody>().isKinematic = false; //Ahtasham
    //    StopCoroutine(Level10());

    //}
    IEnumerator FirstDemoWait()
    {
        SkipButton.SetActive(true);
        yield return new WaitForSeconds(Demos[PlayerPrefs.GetInt("level_number")].GetComponent<DemoTimer>().time);
        SkipButton.SetActive(false);
        DemoTimer.Instance.fade.SetActive(true);
        Demos[PlayerPrefs.GetInt("level_number")].SetActive(false);
        Destroy(Democars);
        GamePlayManager.inst.ActiveCar();
        GamePlayManager.inst.OneTwoThreeGo();
        GamePlayManager.inst.CarSelectionPanel.SetActive(false);
        GamePlayManager.inst.Skip.SetActive(true);
       
    }

    public void SkipFun()
    {
        
        DemoTimer.Instance.fade.SetActive(true);
        Demos[PlayerPrefs.GetInt("level_number")].SetActive(false);
        Destroy(Democars);
        GamePlayManager.inst.ActiveCar();
        GamePlayManager.inst.OneTwoThreeGo();
        GamePlayManager.inst.CarSelectionPanel.SetActive(false);
        GamePlayManager.inst.Skip.SetActive(true);
        //GamePlayManager.inst.carscam.SetActive(false);
        StopAllCoroutines();
    }
    public void OffObject(bool val)
    {
        if (Democars)
            Democars.SetActive(val);
    }

    void Directcounting()
    {
        SkipButton.SetActive(false);
        GamePlayManager.inst.RcPanel.SetActive(true);
        GamePlayManager.inst.rccam.SetActive(true);
        //SoundsManager1._instance.PlayMusic_Game(Random.Range(0, SoundsManager1._instance.ga.));
        GamePlayManager.inst.CarSelectionPanel.SetActive(false);
        GamePlayManager.inst.Skip.SetActive(false);
        GamePlayManager.inst.ActiveCar();
    }
}
