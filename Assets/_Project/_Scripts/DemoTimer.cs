using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using PathSystem;
public class DemoTimer : MonoBehaviour
{
    public static DemoTimer Instance;
    public float time;
    public bool ForcingMen,blur,Drone,Canon,Gift,Container,Driver,lightiing,Helicopter,Dragon,Dragon2,Rocket,Zip,Space,Tele,fork,Fireworks,Blade;
    public GameObject Camera,Camera_1,Camera_2,MenForcing,MenCheering,DroneMd,fade;
    public GameObject dust,VFX, GiftPack,Container1,DrivereMen,CanonStart,HeliModel,HeliModel2,RocketModel,RocketModel2,Surface,Ring,Fire;
    public GameObject DragonModel,ZiplineModel,ZiplineModel2,shipModel;
    public GameObject[]Dumycars;
    public GameObject[] CarsPositions,CarsPositionEnd;
    public GameObject[] CamEnd;


    void Start()
    {
        Instance = this;

        if(ForcingMen)
        {
            StartCoroutine(Level_1());
        }
        else if (blur)
        {
            StartCoroutine(Level_2());
        }
        else if (Drone)
        {
            StartCoroutine(Level_3());
        }
        else if (Canon)
        {
            StartCoroutine(Level_4());
        }
        else if (Gift)
        {
            StartCoroutine(Level_5());
        }
        else if (Container)
        {
            StartCoroutine(Level_6());
        }
        else if (Driver)
        {
            StartCoroutine(Level_7());
        }
        else if (lightiing)
        {
            StartCoroutine(Level_8());
        }
        else if (Helicopter)
        {
            StartCoroutine(Level_9());
        }
        else if (Dragon)
        {
            StartCoroutine(Level_10());     
        }
        else if (Dragon2)
        {
            StartCoroutine(Level_11());
        }
        else if (Rocket)
        {

            StartCoroutine(Level_12());
        }
        else if (Zip)
        {
            StartCoroutine(Level_13());
        }
        else if (Space)
        {
            StartCoroutine(Level_14());
        }
        else if (Tele)
        {
            StartCoroutine(Level_15());
        }
        else if (fork)
        {
            StartCoroutine(Level_16());
        }
        else if (Fireworks)
        {
            StartCoroutine(Level_17());
        }
        else if (Blade)
        {
            StartCoroutine(Level_18());
        }
    }

    #region Demo Functionalities

    IEnumerator Level_1()
    {
        fade.SetActive(true);
        Camera.SetActive(true);
        yield return new WaitForSeconds(11f);
        fade.SetActive(true);
        Camera.SetActive(false);
        Camera_1.SetActive(true);
        VFX.SetActive(true);
        MenCheering.SetActive(true);
        MenForcing.SetActive(false);
        DemoManager.Instance.Democars.GetComponent<PathSystem_Object>().enabled = false;
        StopAllCoroutines();
    }
    IEnumerator Level_2()
    {
        yield return new WaitForSeconds(0f);
        DemoManager.Instance.Democars.GetComponent<PathSystem_Object>().enabled = false;

    }
    IEnumerator Level_3()
    {
        fade.SetActive(true);
        Camera_1.SetActive(true);
        yield return new WaitForSeconds(8f);
        fade.SetActive(true);
        yield return new WaitForSeconds(1f);
        Camera_1.SetActive(false);
        Camera_2.SetActive(true);
        yield return new WaitForSeconds(21f);
        fade.SetActive(true);
        yield return new WaitForSeconds(1f);
        Camera_2.SetActive(false);
        Camera.SetActive(true);
       // CamEnd[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(2, 2, 2);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositions[PlayerPrefs.GetInt("MNum")].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositions[PlayerPrefs.GetInt("MNum")].transform.rotation;
        DemoManager.Instance.Democars.SetActive(false);
        DroneMd.SetActive(false);
        MenCheering.SetActive(true);
        yield return new WaitForSeconds(2f);
        VFX.SetActive(true);
        yield return new WaitForSeconds(0.5f);
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true; //Ahtasham
        dust.SetActive(true);
        StopAllCoroutines();

    }
    IEnumerator Level_4()
    {
        DemoManager.Instance.Democars.GetComponent<PathSystem_Object>().enabled = false;
        VFX.SetActive(true);
        Camera.SetActive(true);
        yield return new WaitForSeconds(3f);
        CanonStart.gameObject.GetComponent<Animator>().enabled = true;
        VFX.SetActive(true);
        Camera.gameObject.GetComponent<Animator>().enabled = true;
        DrivereMen.SetActive(true);
        StopAllCoroutines();

    }
    IEnumerator Level_5()
    {
        fade.SetActive(true);
        yield return new WaitForSeconds(3f);
        GiftPack.gameObject.GetComponent<Animator>().enabled = true;
        VFX.SetActive(true);
        
        StopAllCoroutines();
    }
    IEnumerator Level_6()
    {
        Debug.Log("Container waly mai agya hay Level_6");
        fade.SetActive(true);
        //Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true; //Ahtasham
        yield return new WaitForSeconds(3f);
        Fire.SetActive(false);
        Container1.gameObject.GetComponent<Animator>().enabled = true;
        Container1.gameObject.GetComponent<AudioSource>().enabled = true;
        VFX.SetActive(true);
        StopAllCoroutines();

    }
    IEnumerator Level_7()
    {
        DemoManager.Instance.Democars.GetComponent<PathSystem_Object>().enabled = false;
        Camera.SetActive(true);
        yield return new WaitForSeconds(2f);
        CanonStart.gameObject.GetComponent<Animator>().enabled = true;
        VFX.SetActive(true);
        Camera.gameObject.GetComponent<Animator>().enabled = true;
        DrivereMen.SetActive(true);
        yield return new WaitForSeconds(3f);
        fade.SetActive(true);
        Fire.SetActive(true);
        DrivereMen.GetComponent<PathSystem_Object>().enabled = false;
        DrivereMen.transform.localScale = new Vector3(2,2,2);
        StopAllCoroutines();

    }
    IEnumerator Level_8()
    {
        RenderSettings.ambientLight = Color.black;
        yield return new WaitForSeconds(3f);
        VFX.SetActive(true);
        RenderSettings.ambientLight = Color.white;
        yield return new WaitForSeconds(1f);
        Ring.SetActive(true);
        StopAllCoroutines();

    }
    IEnumerator Level_9()
    {
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositions[PlayerPrefs.GetInt("MNum")].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositions[PlayerPrefs.GetInt("MNum")].transform.rotation;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.parent = HeliModel.transform;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(2f, 2f, 2f);
        yield return new WaitForSeconds(3f);
        Camera.SetActive(false);
        Camera_1.SetActive(true);
        yield return new WaitForSeconds(5f);
        fade.SetActive(true);
        yield return new WaitForSeconds(1f);
        Camera_1.SetActive(false);
        Camera_2.SetActive(true);
        HeliModel.SetActive(false);
        HeliModel2.SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true); 
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = false;  
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.parent = HeliModel2.transform;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(2f, 2f, 2f);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositionEnd[PlayerPrefs.GetInt("MNum")].transform.position; 
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositionEnd[PlayerPrefs.GetInt("MNum")].transform.rotation; 
        VFX.SetActive(true);
        Surface.SetActive(false); 
        dust.SetActive(true);
        yield return new WaitForSeconds(2f);
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true; //Ahtasham
        StopAllCoroutines();

    }
    IEnumerator Level_10()
    {
        Debug.Log("dragon waly mai agya hay Level_10");
        yield return new WaitForSeconds(2f);
        DragonModel.gameObject.GetComponent<Animation>().CrossFade("breath fire");
        VFX.SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true; //Ahtasham
        yield return new WaitForSeconds(2f);
        Fire.SetActive(true);
        yield return new WaitForSeconds(3f);
        DragonModel.gameObject.GetComponent<Animation>().CrossFade("fly");
        VFX.SetActive(false);
        //yield return new WaitForSeconds(0.5f);
        
        StopAllCoroutines();

    }
    IEnumerator Level_11()
    {
        if (PlayerPrefs.GetInt("level_number") == 10 && (PlayerPrefs.GetInt("MNum") == 5 || PlayerPrefs.GetInt("MNum") == 6 
            || PlayerPrefs.GetInt("MNum") == 7 || PlayerPrefs.GetInt("MNum") == 8 || PlayerPrefs.GetInt("MNum") == 9))
        {
            Debug.Log("scale up");
            Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
            Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositions[PlayerPrefs.GetInt("MNum")].transform.position;
            Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositions[PlayerPrefs.GetInt("MNum")].transform.rotation;
            Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true;
            Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().useGravity = false;
            Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(3f,3f, 3f);
            Dumycars[PlayerPrefs.GetInt("MNum")].transform.parent = DragonModel.transform;
        }
        else
        {
            Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
            Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositions[PlayerPrefs.GetInt("MNum")].transform.position;
            Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositions[PlayerPrefs.GetInt("MNum")].transform.rotation;
            Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true;
            Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().useGravity = false;
            Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(1.5f, 1.5f, 1.5f);
            Dumycars[PlayerPrefs.GetInt("MNum")].transform.parent = DragonModel.transform;
        }

        yield return new WaitForSeconds(3f);
        fade.SetActive(true);
        Camera.SetActive(false);
        Camera_1.SetActive(true);
        yield return new WaitForSeconds(8f);
        DragonModel.GetComponent<PathSystem_Object>().enabled = false;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = false;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().useGravity = true;
        Surface.GetComponent<Animator>().enabled = true;
        Camera_1.SetActive(false);
        Camera_2.SetActive(true);
        //Camera_2.GetComponent<Animator>().enabled = true;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.Rotate(0, 175, 0);
        VFX.SetActive(true);
        StopAllCoroutines();

    }
    IEnumerator Level_12()
    {
        yield return new WaitForSeconds(4.5f);
        Camera.SetActive(false);
        Camera_1.SetActive(true);
        RocketModel.GetComponent<Animator>().enabled = true;
        yield return new WaitForSeconds(1f);
        fade.SetActive(true);
        yield return new WaitForSeconds(1f);
        Camera_1.SetActive(false);
        Camera_2.SetActive(true);
        RocketModel2.SetActive(true);
        RocketModel.SetActive(false);
        if ((PlayerPrefs.GetInt("level_number") == 11 && (PlayerPrefs.GetInt("MNum") == 5 || PlayerPrefs.GetInt("MNum") == 6
            || PlayerPrefs.GetInt("MNum") == 7 || PlayerPrefs.GetInt("MNum") == 8 || PlayerPrefs.GetInt("MNum") == 9)))
        {
            Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(3f, 3f, 3f);
        }
        else
        {
            Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(1f, 1f, 1f);

        }
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositionEnd[11].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositionEnd[11].transform.rotation;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.parent = RocketModel2.transform;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().useGravity = false;
        yield return new WaitForSeconds(0.1f);
        Camera_2.GetComponent<Animator>().enabled = true;
        yield return new WaitForSeconds(2f);
        RocketModel2.GetComponent<Animator>().enabled = true;
        RocketModel2.GetComponent<AudioSource>().enabled = true;
        yield return new WaitForSeconds(5f);
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = false;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().useGravity = true;
        yield return new WaitForSeconds(0.2f);
        VFX.SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.parent = Surface.transform;
        yield return new WaitForSeconds(1.5f);
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true;

        StopAllCoroutines();

    }
    IEnumerator Level_13()
    {
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositions[11].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositions[11].transform.rotation;
        //Dumycars[PlayerPrefs.GetInt("MNum")].transform.parent = ZiplineModel.transform;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().useGravity = false;
        yield return new WaitForSeconds(9f);
        fade.SetActive(true);
        Camera.SetActive(false);
        Camera_1.SetActive(true);
        ZiplineModel.GetComponent<PathSystem_Object>().enabled = true;

        if ((PlayerPrefs.GetInt("level_number") == 12 && (PlayerPrefs.GetInt("MNum") == 5 || PlayerPrefs.GetInt("MNum") == 6
            || PlayerPrefs.GetInt("MNum") == 7 || PlayerPrefs.GetInt("MNum") == 8 || PlayerPrefs.GetInt("MNum") == 9)))
        {
            Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(3f, 3f, 3f);
        }
        else
        {
            Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(2f, 2f, 2f);

        }
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositions[12].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositions[12].transform.rotation;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.parent = ZiplineModel.transform;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().useGravity = false;
        yield return new WaitForSeconds(15f);
        fade.SetActive(true);
        ZiplineModel.SetActive(false);
        ZiplineModel2.SetActive(true);
        Camera_1.SetActive(false);
        Camera_2.SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositionEnd[12].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositionEnd[12].transform.rotation;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.parent = ZiplineModel2.transform;
        yield return new WaitForSeconds(2f);
        VFX.SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = false;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().useGravity = true;
        StopAllCoroutines();

    }
    IEnumerator Level_14()
    {
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositions[13].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositions[13].transform.rotation;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(5f, 5f, 5f);
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().useGravity = false;
        yield return new WaitForSeconds(2f);
        VFX.SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(false);
        yield return new WaitForSeconds(2f);
        fade.SetActive(true);
        yield return new WaitForSeconds(1f);
        Camera_1.SetActive(true);
        Camera.SetActive(false);
        shipModel.SetActive(true);
        yield return new WaitForSeconds(4f);
        dust.SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositionEnd[13].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositionEnd[13].transform.rotation;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(2f, 2f, 2f);
        StopAllCoroutines();

    }
    IEnumerator Level_15()
    {
        yield return new WaitForSeconds(1f);
        VFX.SetActive(true);
        yield return new WaitForSeconds(3f);
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositionEnd[13].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositionEnd[13].transform.rotation;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(2f, 2f, 2f);
        //yield return new WaitForSeconds(7f);
        //Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(false);
        StopAllCoroutines();

    }
    IEnumerator Level_16()
    {
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositions[14].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositions[14].transform.rotation;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().useGravity = false;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(8f, 8f, 8f);
        yield return new WaitForSeconds(9f);
        Container1.GetComponent<Animator>().enabled = true;
        Container1.GetComponent<AudioSource>().enabled = true;
        yield return new WaitForSeconds(7f);
        fade.SetActive(true);
        yield return new WaitForSeconds(1f);
        fade.SetActive(true);
        ZiplineModel.SetActive(false);
        ZiplineModel2.SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositionEnd[14].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositionEnd[14].transform.rotation;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().isKinematic = true;
        Dumycars[PlayerPrefs.GetInt("MNum")].gameObject.GetComponent<Rigidbody>().useGravity = false;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(2f, 2f, 2f);
        Camera.SetActive(true);
        yield return new WaitForSeconds(1f);
        ZiplineModel2.GetComponent<Animator>().enabled = true;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.parent = shipModel.transform;
        yield return new WaitForSeconds(1.9f);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.parent = DragonModel.transform;
        yield return new WaitForSeconds(4f);
        Camera.GetComponent<camorbit>().enabled = true;
        VFX.SetActive(true);
        StopAllCoroutines();

    }
    IEnumerator Level_17()
    {
        yield return new WaitForSeconds(5);
        VFX.SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositionEnd[17].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositionEnd[17].transform.rotation;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(2f, 2f, 2f);
        StopAllCoroutines();

    }
    IEnumerator Level_18()
    {
        yield return new WaitForSeconds(3);
        VFX.SetActive(true);
        yield return new WaitForSeconds(3);
        ZiplineModel.SetActive(false);
        ZiplineModel2.SetActive(false);
        Dumycars[PlayerPrefs.GetInt("MNum")].SetActive(true);
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.position = CarsPositionEnd[17].transform.position;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.rotation = CarsPositionEnd[17].transform.rotation;
        Dumycars[PlayerPrefs.GetInt("MNum")].transform.localScale = new Vector3(2f, 2f, 2f);

    }
    #endregion
}
