using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class tirerotate : MonoBehaviour {
	public float Tirespeed;

	// Update is called once per fra~e
	void Update ()
    {
		transform.Rotate (Tirespeed * Time.deltaTime, 0, 0);	
	}
}
