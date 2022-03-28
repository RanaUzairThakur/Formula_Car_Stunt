using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pplayer : MonoBehaviour {
	public GameObject FailPanel, FailText, rcpanel,SSpikes,blastobj;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	void OnTriggerEnter(Collider Target)
	{
		//Debug.Log ("tiggered");
		if (Target.tag== "Sspikes") 
		{
			blastobj.SetActive(true);
//			this.gameObject.GetComponent<Rigidbody> ().useGravity = false;
//			this.gameObject.GetComponent<Rigidbody> ().isKinematic = true;
			this.gameObject.GetComponent<Rigidbody> ().AddForce ((Vector3.back * 1000000) + (Vector3.up * 10000));
			Target.gameObject.GetComponentInParent<Animation> ().enabled = false;
//			SSpikes.SetActive (false);
			GameObject.FindGameObjectWithTag ("Sspikes").SetActive (false);
			rcpanel.SetActive (false);
			FailText.SetActive (true);
			AudioListener.volume = 0;
			StartCoroutine ("levelFail");
			//Debug.Log ("spikes thuk gay");
//			Destroy (Target.gameObject, 0f);
			

		}

	}


	IEnumerator levelFail()
	{
		yield return new WaitForSeconds (5f);
		FailPanel.SetActive (true);
		//AdCalling.showAd (AdsMainManagerController.AdType.GP);
		Time.timeScale = 0.001f;

	}
}
