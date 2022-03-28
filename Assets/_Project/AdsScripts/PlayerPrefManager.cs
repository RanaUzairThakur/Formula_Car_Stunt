using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class PlayerPrefManager : MonoBehaviour {

	public static PlayerPrefManager _instance;

	private void Awake()
	{
		if (_instance == null)
		{
			_instance = this;
		}
		else if (_instance != this)
		{
			Destroy(gameObject);
		}
	}

	public static PlayerPrefManager Instance
	{

		get
		{

			if (_instance == null)
			{

				try
				{
					_instance = GameObject.FindObjectOfType<PlayerPrefManager>();
				}
				catch (Exception e)
				{
					Debug.Log(e.Message);
					_instance = new PlayerPrefManager();
				}

			}

			return _instance;

		}

	}


	void Start()
	{
		Debug.Log("initialized PlayerPrefManager");

	}
    public void RemoveAds()
    {
		if (AdsManager.Instance)
		{
			AdsManager.Instance.HideBannerAd();
			AdsManager.Instance.HideMediumRectangleAd();
		}
		PlayerPrefs.SetInt("RemoveAds", 1);
    }
	public void unlocklevels()
	{
        PlayerPrefs.SetInt("compare", 24);
    }
    public void unlockplayers()
	{
        PlayerPrefs.SetInt("MNum", 9);
    }
    public void MegaPack()
    {
        PlayerPrefs.SetInt("MNum", 9);
        PlayerPrefs.SetInt("compare", 24);
        PlayerPrefs.SetInt("RemoveAds", 1);
    }
    public bool IsAdsRemoved()
    {

        if (PlayerPrefs.GetInt("RemoveAds") == 0)
            return false;
        else
            return true;
    }

  

}
