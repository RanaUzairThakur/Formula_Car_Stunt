using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GCnewone : MonoBehaviour {

	public GameObject Bostshashka;

	void Awak()
	{
//		Bostshashka = GameObject.FindWithTag ("booost");
	}

	// Use this for initialization
	void Start () {

		Bostshashka = GameObject.FindWithTag ("booost");
		Bostshashka.gameObject.transform.GetChild (0).gameObject.SetActive (true);
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
