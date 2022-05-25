using System.Collections;
using UnityEngine;

public class DestroyObject : MonoBehaviour
{
	// Start is called before the first frame update
	public float wait = 10f;
	private GameObject obj;
	void Awake()
	{
		obj = transform.gameObject;
	}

	public IEnumerator DeactivateTimer()
	{
		yield return new WaitForSeconds(wait);
		obj.SetActive(false);
	}
}
