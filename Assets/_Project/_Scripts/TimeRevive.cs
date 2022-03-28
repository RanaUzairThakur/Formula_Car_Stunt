using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
[Serializable]
public class TimeRevive : MonoBehaviour
{
     

	[Serializable]
	public class Pointintime
	{
		public Vector3 position;
		public Quaternion rotation;
		
		public Pointintime(Vector3 _position, Quaternion _rotation)
		{
			position = _position;
			rotation = _rotation;
		}

	}

    public static TimeRevive Instance;
	public float recordTime = 5f;
    public GameObject Car;
	//public GameObject reverseparticle;
	public GameObject Playercamer;
    public GameObject nitro;
	//public Slider timeslider;
	public GameObject timebutton;
	public GameObject[] wheels;
    private float timevalue;
	private bool isRewinding = false;
	private bool boost;
	public bool Fail=false;
    List<Pointintime> pointsInTime;
    List<Vector3> velocity;
	Vector3 target = Vector3.zero;
    int counter;



	// Use this for initialization
	void Start()
	{
        Instance = this;
		pointsInTime = new List<Pointintime>();
		velocity = new List<Vector3>();
		//foreach (Transform child in Car.transform)
		//{
		//	if (child.tag == "reverseparticle")
		//	{
		//	//	reverseparticle = child.gameObject;
		//	}
		//}
		wheels[0] = Car.GetComponent<RCC_CarControllerV3>().FrontLeftWheelTransform.gameObject;
		wheels[1] = Car.GetComponent<RCC_CarControllerV3>().FrontRightWheelTransform.gameObject;
		wheels[2] = Car.GetComponent<RCC_CarControllerV3>().RearLeftWheelTransform.gameObject;
		wheels[3] = Car.GetComponent<RCC_CarControllerV3>().RearRightWheelTransform.gameObject;
	}




	void FixedUpdate()
	{
		if (isRewinding)
			Rewind();
		else
			Record();

		//if (timeslider.value < 1 && isRewinding == false)
		//{
		//	timeslider.value = timevalue;
		//	timevalue += 0.0035f;

		//}
		//if (timeslider.value > 0 && isRewinding == true)
		//{
		//	timeslider.value = timevalue;
		//	timevalue -= 0.0041f;
		//}
		
		//if (timeslider.value == 1 && boost == false)
		//{
		//	timebutton.SetActive(true);
		//}
		//if (timeslider.value == 0)
		//{
		//	timebutton.SetActive(false);
		//}
	}

	void Rewind()
	{
       
		if (counter > 0)
		{
			Pointintime pointInTime = pointsInTime[0];
			Vector3 velocity1 = velocity[0];
			Car.transform.position = pointInTime.position;
			Car.transform.rotation = pointInTime.rotation;
			Car.GetComponent<Rigidbody>().velocity = Vector3.zero;
			Car.GetComponent<Rigidbody>().angularVelocity = Vector3.zero;
			target = velocity[0];
			pointsInTime.RemoveAt(0);
			velocity.RemoveAt(0);
            counter--;
           // Debug.LogError("Rewind");

        }
		else
		{
            StopRewind();
          
		}
	}

	void Record()
	{
		if (pointsInTime.Count > Mathf.Round(recordTime / Time.fixedDeltaTime))
		{
			pointsInTime.RemoveAt(pointsInTime.Count - 1);
			velocity.RemoveAt(pointsInTime.Count - 1);
		}

		pointsInTime.Insert(0, new Pointintime(Car.transform.position, Car.transform.rotation));
		velocity.Insert(0, Car.GetComponent<Rigidbody>().velocity);
	}

	public void StartRewind(int number)
	{
        //Debug.LogError("Rewind");
        //nitro.SetActive(false);
        isRewinding = true;  
        counter = pointsInTime.Count / number;
        Time.timeScale = 0.7f;

	}

	public void StopRewind()
	{
     
        Car.GetComponent<Rigidbody>().velocity =Vector3.zero;
        nitro.SetActive(true);
		isRewinding = false;
		timebutton.SetActive(false);
        player_Car.Instance.RewindCount--;
        player_Car.Instance.callback();
		Time.timeScale = 1f;
        RCC_CarControllerV3.instance.canControl = true;
        GamePlayManager.inst.RcPanel.SetActive(true);
        //GamePlayManager.inst.N = false;

    }
}

