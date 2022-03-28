using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class nos : MonoBehaviour {
	public int Max;
	public int Min;
    float t=0.01f;
	public static bool NOS = false;
	public static bool NOSBACK = false;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		if (NOS) {
			Debug.Log ("NOS :"+Camera.main.fieldOfView );
			Camera.main.fieldOfView = Mathf.Lerp (Camera.main.fieldOfView, Max, t);
			t += 0.1f * Time.deltaTime;
			if (Camera.main.fieldOfView >=Max) {
				NOS = false;
				Camera.main.fieldOfView = 60f;

			}
		}

//		else if (!NOS && NOSBACK) {
//			Debug.Log ("NOSBack :"+Camera.main.fieldOfView );
//			Camera.main.fieldOfView = Mathf.Lerp (Camera.main.fieldOfView, Min, t);
//			t += 0.1f  * Time.deltaTime;
//			if (Camera.main.fieldOfView <=Min) {
//				NOSBACK = false;
//				//NOSBACK = true;
//				t=0.01f;
//			}
//			}
//	


	}
	void OnTriggerEnter(Collider col)

	{
		GameObject parent = col.gameObject.transform.parent.root.gameObject;
		Debug.Log ("Nos :"+parent);
		if (parent.gameObject.CompareTag ("Player"))
		{
			//parent.gameObject.GetComponent<RCC_CarControllerV3>().speedMult=300;
			parent.gameObject.GetComponent<Rigidbody>().AddForce(transform.forward*30000*Time.deltaTime,ForceMode.Acceleration);
			NOS = true;
			NOSDESTROY ();
			Debug.Log ("Nos");

		}

	}


	public void NOSDESTROY()
	{
		this.gameObject.GetComponent<SpriteRenderer> ().enabled = false;
	}
}
