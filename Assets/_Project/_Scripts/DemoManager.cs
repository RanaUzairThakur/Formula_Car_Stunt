using PathSystem;
using System.Collections;
using UnityEngine;
public class DemoManager : MonoBehaviour
{
    public static DemoManager Instance;

    [Space(10)]
    [Header("DemoCars")]
    public GameObject[] Car_List;
    public GameObject[] Demos;
    [Space(10)]
    [Header("SpwanPositions")]
    public GameObject[] Positions;
    [Space(10)]
    [Header("Paths")]
    public PathSystem_Branch[] Paths;
    public PathSystem_Branch[] Paths2;
    public PathSystem_Branch[] personPaths;
    public GameObject[] GP;
    public GameObject Person;
    public GameObject GPSound;
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


        if (PlayerPrefs.GetInt("level_number") == 9)
        {

            Democars = Instantiate(Car_List[PlayerPrefs.GetInt("MNum")], Positions[PlayerPrefs.GetInt("level_number")].transform.position, Positions[PlayerPrefs.GetInt("level_number")].transform.rotation);
            Democars.transform.localScale = new Vector3(2.5f, 2.5f, 2.5f);
            Democars.gameObject.GetComponent<Rigidbody>().isKinematic = true;
        }



        if (PlayerPrefs.GetInt("level_number") == 11)
        {
            Democars = Instantiate(Car_List[PlayerPrefs.GetInt("MNum")], Positions[PlayerPrefs.GetInt("level_number")].transform.position, Positions[PlayerPrefs.GetInt("level_number")].transform.rotation);
            Democars.GetComponent<PathSystem_Object>().pathSys_SwitchBranch(Paths[PlayerPrefs.GetInt("level_number")]);

        }
        if (PlayerPrefs.GetInt("level_number") == 2)
        {
            Democars = Instantiate(Car_List[PlayerPrefs.GetInt("MNum")], Positions[PlayerPrefs.GetInt("level_number")].transform.position, Positions[PlayerPrefs.GetInt("level_number")].transform.rotation);
            Democars.GetComponent<PathSystem_Object>().pathSys_SwitchBranch(Paths[PlayerPrefs.GetInt("level_number")]);
            Democars.gameObject.GetComponent<Rigidbody>().isKinematic = true;

        }
        if (PlayerPrefs.GetInt("level_number") == 3)
        {

            Democars = Instantiate(Car_List[PlayerPrefs.GetInt("MNum")], Positions[PlayerPrefs.GetInt("level_number")].transform.position, Positions[PlayerPrefs.GetInt("level_number")].transform.rotation);
            Democars.GetComponent<Animator>().enabled = true;
            Democars.GetComponent<PathSystem_Object>().pathSys_SwitchBranch(Paths[PlayerPrefs.GetInt("level_number")]);

        }
        //if (PlayerPrefs.GetInt("level_number") == 4 || PlayerPrefs.GetInt("level_number") == 5) // Ahtasham
        //if (PlayerPrefs.GetInt("level_number") == 0 || PlayerPrefs.GetInt("level_number") == 5)
        if (PlayerPrefs.GetInt("level_number") == 5)
        {
            //Debug.Log("Level number 4 mai agya hay yah 5 mai shyd ayaa hay");
            Democars = Instantiate(Car_List[PlayerPrefs.GetInt("MNum")], Positions[PlayerPrefs.GetInt("level_number")].transform.position, Positions[PlayerPrefs.GetInt("level_number")].transform.rotation);
            Democars.transform.localScale = new Vector3(1.5f, 1.5f, 1.5f);
            Democars.GetComponent<PathSystem_Object>().enabled = false;
            //Democars.gameObject.GetComponent<Rigidbody>().isKinematic = false; //Ahtasham
            //Democars.gameObject.GetComponent<Rigidbody>().isKinematic = true;
        }
        if (PlayerPrefs.GetInt("level_number") == 6)
        {
            Democars = Instantiate(Car_List[PlayerPrefs.GetInt("MNum")], Positions[PlayerPrefs.GetInt("level_number")].transform.position, Positions[PlayerPrefs.GetInt("level_number")].transform.rotation);
            Democars.transform.localScale = new Vector3(1.2f, 1.2f, 1.2f);
            Democars.GetComponent<PathSystem_Object>().pathSys_SwitchBranch(Paths[PlayerPrefs.GetInt("level_number")]);

        }
        if (PlayerPrefs.GetInt("level_number") == 0)
        {
            Democars = Instantiate(Car_List[PlayerPrefs.GetInt("MNum")], Positions[PlayerPrefs.GetInt("level_number")].transform.position, Positions[PlayerPrefs.GetInt("level_number")].transform.rotation);
            Democars.transform.localScale = new Vector3(2.5f, 2.5f, 2.5f);
            Democars.gameObject.GetComponent<Rigidbody>().isKinematic = true;
        }
        if (PlayerPrefs.GetInt("level_number") == 7)
        {
            StartCoroutine(Level8());
        }
        if (PlayerPrefs.GetInt("level_number") == 4)
        {
            StartCoroutine(Level10());

        }
        Demos[PlayerPrefs.GetInt("level_number")].SetActive(true);
        Car_List[PlayerPrefs.GetInt("MNum")].SetActive(true);
        StartCoroutine(FirstDemoWait());
    }
    IEnumerator Level8()
    {
        yield return new WaitForSeconds(3.5f);
        Democars = Instantiate(Car_List[PlayerPrefs.GetInt("MNum")], Positions[PlayerPrefs.GetInt("level_number")].transform.position, Positions[PlayerPrefs.GetInt("level_number")].transform.rotation);
        Democars.transform.localScale = new Vector3(2f, 2f, 2f);
        Democars.transform.Rotate(0, 90, 0);
        StopCoroutine(Level8());
    }
    IEnumerator Level10()
    {
        //Debug.Log("Level 10 waly function mai agya hay");
        yield return new WaitForSeconds(4f);
        Democars = Instantiate(Car_List[PlayerPrefs.GetInt("MNum")], Positions[PlayerPrefs.GetInt("level_number")].transform.position, Positions[PlayerPrefs.GetInt("level_number")].transform.rotation);
        Democars.transform.localScale = new Vector3(2.5f, 2.5f, 2.5f);
        //Democars.gameObject.GetComponent<Rigidbody>().isKinematic = false; //Ahtasham
        StopCoroutine(Level10());

    }
    IEnumerator FirstDemoWait()
    {
        yield return new WaitForSeconds(Demos[PlayerPrefs.GetInt("level_number")].GetComponent<DemoTimer>().time);
        SkipButton.SetActive(false);
        DemoTimer.Instance.fade.SetActive(true);
        Demos[PlayerPrefs.GetInt("level_number")].SetActive(false);
        Destroy(Democars);
        GP[Random.Range(0, GP.Length)].SetActive(true);
        GamePlayManager.inst.ActiveCar();
        GamePlayManager.inst.OneTwoThreeGo();
        GamePlayManager.inst.CarSelectionPanel.SetActive(false);
        GamePlayManager.inst.Skip.SetActive(true);
        //GamePlayManager.inst.carscam.SetActive(false);
        if (PlayerPrefs.GetInt("level_number") == 14 || PlayerPrefs.GetInt("level_number") == 15 || PlayerPrefs.GetInt("level_number") == 17 || PlayerPrefs.GetInt("level_number") == 18
            || PlayerPrefs.GetInt("level_number") == 19 || PlayerPrefs.GetInt("level_number") == 20 || PlayerPrefs.GetInt("level_number") == 21 || PlayerPrefs.GetInt("level_number") == 22
            || PlayerPrefs.GetInt("level_number") == 23 || PlayerPrefs.GetInt("level_number") == 24 || PlayerPrefs.GetInt("level_number") == 12 || PlayerPrefs.GetInt("level_number") == 13
            || PlayerPrefs.GetInt("level_number") == 2)
        {
            if (DemoTimer.Instance.Dumycars.Length>0)
                DemoTimer.Instance.Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(false);

        }

    }

    public void SkipFun()
    {
        if (PlayerPrefs.GetInt("level_number") == 14 || PlayerPrefs.GetInt("level_number") == 15 || PlayerPrefs.GetInt("level_number") == 17 || PlayerPrefs.GetInt("level_number") == 18
            || PlayerPrefs.GetInt("level_number") == 19 || PlayerPrefs.GetInt("level_number") == 20 || PlayerPrefs.GetInt("level_number") == 21 || PlayerPrefs.GetInt("level_number") == 22
            || PlayerPrefs.GetInt("level_number") == 23 || PlayerPrefs.GetInt("level_number") == 24 || PlayerPrefs.GetInt("level_number") == 12 || PlayerPrefs.GetInt("level_number") == 13
            || PlayerPrefs.GetInt("level_number") == 2)
        {
            if (DemoTimer.Instance.Dumycars.Length > 0)
                DemoTimer.Instance.Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(false);

        }
        DemoTimer.Instance.fade.SetActive(true);
        Demos[PlayerPrefs.GetInt("level_number")].SetActive(false);
        Destroy(Democars);
        GP[Random.Range(0, GP.Length)].SetActive(true);
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
}
