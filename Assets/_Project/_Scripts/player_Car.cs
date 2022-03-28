using UnityEngine;
using UnityEngine.UI;
using System.Collections;


public class player_Car : MonoBehaviour {
    public static player_Car Instance;
	public GameObject Player_Car_Camera;
    public AudioSource ProbsSounds;
    public AudioClip CheckPointSound, NitroSound,FootBall,Bowling,Star;
    public Text Rewind;
    public int RewindCount;
    private GameObject Dummy;
	public GameObject Stunt_Cam,Stunt_Sound;
    bool OneTime;
    private void Start()
    {
        Instance = this;
        RewindCount = 1;
        Rewind.text = RewindCount.ToString();

    }
    //private void Update()
    //{
    //    Rewind.text = RewindCount.ToString();

    //}
    public  void callback()
    {
        if (RewindCount>0)
        {
            Rewind.text = RewindCount.ToString();
            TimeRevive.Instance.timebutton.SetActive(true);
        }
    }

    void OnTriggerEnter(Collider col)
	{
		if (col.gameObject.tag == "start_stunt") 
		{
            Debug.Log("Stunt On");
			Player_Car_Camera.GetComponent<RCC_Camera> ().enabled = false;
            Stunt_Cam.SetActive(true);
            this.gameObject.GetComponent<HandleTyreGrip>().enabled = false;
            Time.timeScale = 0.5f;
            Stunt_Sound.SetActive(true);
        }

        if (col.gameObject.tag == "End_stunt") 
		{
            Debug.Log("Stunt Off");
            Player_Car_Camera.GetComponent<RCC_Camera> ().enabled = true;
            this.gameObject.GetComponent<HandleTyreGrip>().enabled = true;
            Stunt_Cam.SetActive(false);
            Time.timeScale = 1f;

		}
        if (col.gameObject.tag == "Nos")
        {
            // GamePlayManager.inst.N = true;
            //ProbsSounds.clip = NitroSound;
            //ProbsSounds.Play();
            ProbsSounds.clip = CheckPointSound;
            ProbsSounds.Play();
            Destroy(col.gameObject);
        }
        if (col.gameObject.tag == "Check")
        {
            TimeRevive.Instance.timebutton.SetActive(true);
            RewindCount++;
            Rewind.text = RewindCount.ToString();
            ProbsSounds.clip = CheckPointSound;
            ProbsSounds.Play();
            Destroy(col.gameObject);

        }
        if (col.gameObject.tag == "Star")
        {

            ProbsSounds.clip = Star;
            ProbsSounds.Play();
            Destroy(col.gameObject);

        }
        if (col.gameObject.tag == "Time" )
        {
            OneTime = true;
            StartCoroutine(CarAddForec());
            RCC_CarControllerV3.instance.skid = true;
            GamePlayManager.inst.RcPanel.SetActive(false);
            Destroy(col.gameObject);
            Invoke("Delay", 2f);
        }
        if (col.gameObject.tag == "LeftRight")
        {
            //GamePlayManager.inst.LeftRightPanel.SetActive(true);
            //GamePlayManager.inst.RcPanel.SetActive(false);
            GamePlayManager.inst.left.GetComponent<Animator>().enabled = true;
            GamePlayManager.inst.right.GetComponent<Animator>().enabled = true;
            Time.timeScale = 0.5f;
            Destroy(col.gameObject);
;       }

    }
    public void Delay()
    {
        OneTime = false;
        GamePlayManager.inst.TutorailPanel.SetActive(true);
        Time.timeScale = 0.1f;
    }
    public void OnCollisionEnter(Collision collision)
    {
        //Dummy = collision.gameObject;
        if (collision.gameObject.tag == "Foot")
        {

            ProbsSounds.clip = FootBall;
            ProbsSounds.Play();
           // StartCoroutine(FootBal());

        }
        if (collision.gameObject.tag == "Bowling")
        {
            ProbsSounds.clip = Bowling;
            ProbsSounds.Play();
           // StartCoroutine(Bowl());

        }
    }
    //IEnumerator FootBal()
    //{
    //    yield return new WaitForSeconds(15f);
    //    Destroy(Dummy.gameObject);
    //}
    IEnumerator CarAddForec()
    {
        
            gameObject.GetComponent<Rigidbody>().AddRelativeForce(Vector3.forward * 80000f);
        yield return new WaitForSeconds(0.001f);
        if (OneTime)
            StartCoroutine(CarAddForec());


    }
 
}
